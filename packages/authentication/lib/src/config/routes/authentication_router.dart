import 'package:your_stock_core/your_stock_core.dart';

import 'authentication_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AuthenticationRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterationRoute.page),
        AutoRoute(page: VerificationRoute.page),
        AutoRoute(page: SplashRoute.page),

      ];
}
