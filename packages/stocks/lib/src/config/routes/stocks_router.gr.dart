// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:stocks/src/features/stock_details/presentations/screens/stock_details_screen.dart'
    as _i1;
import 'package:stocks/src/features/stocks/presentations/screens/stocks_screen.dart'
    as _i2;
import 'package:your_stock_design_system/your_stock_design_system.dart' as _i4;

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
class StocksRoute extends _i3.PageRouteInfo<void> {
  const StocksRoute({List<_i3.PageRouteInfo>? children})
      : super(
          StocksRoute.name,
          initialChildren: children,
        );

  static const String name = 'StocksRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.StocksScreen();
    },
  );
}
