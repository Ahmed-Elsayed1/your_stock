import 'package:your_stock_core/your_stock_core.dart';

import 'stocks_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class StocksRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
          AutoRoute(page: StockDetailsRoute.page),
          AutoRoute(page: StocksRoute.page),
      ];
}
