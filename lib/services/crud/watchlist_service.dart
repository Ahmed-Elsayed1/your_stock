import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:yourstock/services/crud/crud_exception.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

class WatchlistService {
  Database? _db;

  List<DatabaseWatchlist> _tickers = [];

  static final WatchlistService _shared = WatchlistService._sharedInstance();
  WatchlistService._sharedInstance() {
    _tickersStreamController =
        StreamController<List<DatabaseWatchlist>>.broadcast(
      onListen: () {
        _tickersStreamController.sink.add(_tickers);
      },
    );
  }
  factory WatchlistService() => _shared;

  late final StreamController<List<DatabaseWatchlist>> _tickersStreamController;

  Stream<List<DatabaseWatchlist>> get allWatchlist =>
      _tickersStreamController.stream;

  Future<DatabaseUser> getOrCreateUser({required String email}) async {
    try {
      final user = await getUser(email: email);
      return user;
    } on CouldNotFindUser {
      final createdUser = await createUser(email: email);
      return createdUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _cacheWatchlist() async {
    final allWatchlist = await getAllWatchlist();
    _tickers = allWatchlist.toList();
    _tickersStreamController.add(_tickers);
  }

  Future<Iterable<DatabaseWatchlist>> getAllWatchlist() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final watchlist = await db.query(
      watchlistTable,
    );
    return watchlist
        .map((watchlistRow) => DatabaseWatchlist.fromRow(watchlistRow));
  }

  Future<DatabaseWatchlist> getWatchlistItem({required int id}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final watchlist = await db.query(
      watchlistTable,
      limit: 1,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (watchlist.isEmpty) {
      throw CouldNotFindWatchlistItem();
    } else {
      final watchlistItem = DatabaseWatchlist.fromRow(watchlist.first);
      _tickers.removeWhere((watchlistItem) => watchlistItem.id == id);
      _tickers.add(watchlistItem);
      _tickersStreamController.add(_tickers);
      return watchlistItem;
    }
  }

  Future<int> deleteAllWatchlist() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final numberOfDeletion = await db.delete(watchlistTable);
    _tickers = [];
    _tickersStreamController.add(_tickers);
    return numberOfDeletion;
  }

  Future<void> deleteWatchlistItem({required int id}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deleteCount = await db.delete(
      watchlistTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (deleteCount == 0) {
      throw CouldNotDeleteWatchlistItem();
    } else {
      _tickers.removeWhere((watchlistItem) => watchlistItem.id == id);
      _tickersStreamController.add(_tickers);
    }
  }

  Future<DatabaseWatchlist> createWatchlistItem(
      {required DatabaseUser owner}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final dbUser = await getUser(email: owner.email);
    if (dbUser != owner) {
      throw CouldNotFindUser();
    }

    const ticker = '';
    final watchlistItemId = await db.insert(watchlistTable, {
      userIdColumn: owner.id,
      tickerColumn: ticker,
    });
    final watchlistItem = DatabaseWatchlist(
      id: watchlistItemId,
      userId: owner.id,
      ticker: ticker,
    );

    _tickers.add(watchlistItem);
    _tickersStreamController.add(_tickers);

    return watchlistItem;
  }

  Future<DatabaseUser> getUser({required String email}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      userTable,
      limit: 1,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );
    if (results.isEmpty) {
      throw CouldNotFindUser();
    }
    return DatabaseUser.fromRow(results.first);
  }

  Future<DatabaseUser> createUser({required String email}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(
      userTable,
      limit: 1,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );
    if (results.isNotEmpty) {
      throw UserAlreadyExists();
    }
    final userId = await db.insert(
      userTable,
      {
        emailColumn: email.toLowerCase(),
      },
    );
    return DatabaseUser(
      id: userId,
      email: email,
    );
  }

  Future<void> deleteUser({required String email}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deleteCount = await db.delete(
      userTable,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );
    if (deleteCount == 0) {
      throw CouldNotDeleteUser();
    }
  }

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseNotOpen();
    } else {
      return db;
    }
  }

  Future<void> close() async {
    final db = _db;
    if (db == null) {
      throw DatabaseNotOpen();
    } else {
      await db.close();
      _db = null;
    }
  }

  Future<void> _ensureDbIsOpen() async {
    try {
      await open();
    } on DatabaseAlreadyOpenException {
      // empty
    }
  }

  Future<void> open() async {
    if (_db != null) {
      throw DatabaseAlreadyOpenException();
    }
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbWatchlist);
      final db = await openDatabase(dbPath);
      _db = db;

      // create user table
      await db.execute(createUserTable);
      // create watchlist table
      await db.execute(createWatchlistTable);
      await _cacheWatchlist();
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectory();
    }
  }
}

@immutable
class DatabaseUser {
  final int id;
  final String email;

  const DatabaseUser({
    required this.id,
    required this.email,
  });

  DatabaseUser.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        email = map[emailColumn] as String;

  @override
  String toString() => 'Person, ID = $id, Email = $email';

  @override
  bool operator ==(covariant DatabaseUser other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class DatabaseWatchlist {
  final int id;
  final int userId;
  final String ticker;

  const DatabaseWatchlist({
    required this.id,
    required this.userId,
    required this.ticker,
  });

  DatabaseWatchlist.fromRow(Map<String, Object?> map)
      : id = [idColumn] as int,
        userId = [userIdColumn] as int,
        ticker = [tickerColumn] as String;

  @override
  String toString() => 'Id = $id, userId = $userId';

  @override
  bool operator ==(covariant DatabaseWatchlist other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

const dbWatchlist = 'YourStockDB.db';
const watchlistTable = 'watchlist';
const userTable = 'user';
const idColumn = 'id';
const emailColumn = 'email';
const userIdColumn = 'user_id';
const tickerColumn = 'ticker';
const createUserTable = '''CREATE TABLE IF NOT EXISTS "user" (
	"id"	INTEGER NOT NULL,
	"email"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
''';
const createWatchlistTable = '''CREATE TABLE IF NOT EXISTS "watchlist" (
	"id"	INTEGER NOT NULL,
	"user_id"	INTEGER NOT NULL,
	"ticker"	TEXT NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "user"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
''';
