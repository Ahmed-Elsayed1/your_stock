import 'package:your_stock_core/your_stock_core.dart';

import 'di/di.dart';
import 'routes/routes.dart';

class AuthenticationResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => AuthenticationInjectionModule();

  @override
  RouterModule? get routerModule => AuthenticationRouterModule();
}
