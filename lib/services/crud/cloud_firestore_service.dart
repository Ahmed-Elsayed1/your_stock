import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yourstock/services/crud/crud_exception.dart';

class WatchlistDb {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  final tickerList = [];
  final CollectionReference collection =
      FirebaseFirestore.instance.collection("usersWatchlist");

  Future<void> createWatchlist() async {
    if (await isWatchlistExist() == false) {
      final user = <String, dynamic>{"userId": userId, "ticker": tickerList};
      try {
        await collection.doc(userId).set(user);
      } catch (e) {
        throw CouldNotCreateUserDocument();
      }
    }
  }

  Future<bool> isWatchlistExist() async {
    QuerySnapshot querySnapshot =
        await collection.where(FieldPath.documentId, isEqualTo: userId).get();

    if (querySnapshot.size > 0) return true;

    return false;
  }

  Future<void> deleteWatchlist() async {
    collection.doc(userId).delete();
  }
}
