import 'package:your_stock_core/your_stock_core.dart';

import 'news_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class NewsRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [

        AutoRoute(page: NewsRoute.page),
      ];
}
