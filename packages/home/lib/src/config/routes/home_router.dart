import 'package:your_stock_core/your_stock_core.dart';
import 'package:stocks/stocks.dart';
import 'package:news/news.dart';
import 'package:watch_list/watch_list.dart';
import 'package:settings/settings.dart';

import 'home_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class HomeRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page,
        children: [
          AutoRoute(page: StocksRoute.page),
          AutoRoute(page: WatchListRoute.page),
          AutoRoute(page: NewsRoute.page),
          AutoRoute(page: SettingsRoute.page),
        ]),

      ];
}
