import 'package:your_stock_core/your_stock_core.dart';

import 'routes.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class CommonRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SearchRoute.page),
      ];
}
