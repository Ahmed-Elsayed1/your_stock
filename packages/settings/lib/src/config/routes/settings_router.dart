import 'package:your_stock_core/your_stock_core.dart';

import 'settings_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class SettingsRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SettingsRoute.page),
      ];
}
