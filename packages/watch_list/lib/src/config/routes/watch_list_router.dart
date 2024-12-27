import 'package:your_stock_core/your_stock_core.dart';

import 'watch_list_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class WatchListRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WatchListRoute.page),
      ];
}
