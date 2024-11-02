import 'package:your_stock_core/your_stock_core.dart';

import 'home_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class HomeRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),

      ];
}
