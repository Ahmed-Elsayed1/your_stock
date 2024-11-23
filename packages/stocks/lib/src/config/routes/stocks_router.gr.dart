// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:stocks/src/features/stock_details/presentations/screens/stock_details_screen.dart'
    as _i1;
import 'package:stocks/src/features/stocks/presentations/screens/stocks_screen.dart'
    as _i2;

/// generated route for
/// [_i1.StockDetailsScreen]
class StockDetailsRoute extends _i3.PageRouteInfo<StockDetailsRouteArgs> {
  StockDetailsRoute({
    _i4.Key? key,
    required String symbol,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          StockDetailsRoute.name,
          args: StockDetailsRouteArgs(
            key: key,
            symbol: symbol,
          ),
          initialChildren: children,
        );

  static const String name = 'StockDetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StockDetailsRouteArgs>();
      return _i1.StockDetailsScreen(
        key: args.key,
        symbol: args.symbol,
      );
    },
  );
}

class StockDetailsRouteArgs {
  const StockDetailsRouteArgs({
    this.key,
    required this.symbol,
  });

  final _i4.Key? key;

  final String symbol;

  @override
  String toString() {
    return 'StockDetailsRouteArgs{key: $key, symbol: $symbol}';
  }
}

/// generated route for
/// [_i2.StocksScreen]
class StocksRoute extends _i3.PageRouteInfo<StocksRouteArgs> {
  StocksRoute({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          StocksRoute.name,
          args: StocksRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'StocksRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<StocksRouteArgs>(orElse: () => const StocksRouteArgs());
      return _i2.StocksScreen(key: args.key);
    },
  );
}

class StocksRouteArgs {
  const StocksRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'StocksRouteArgs{key: $key}';
  }
}
