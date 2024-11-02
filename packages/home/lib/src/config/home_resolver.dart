import 'package:your_stock_core/your_stock_core.dart';

import 'di/di.dart';
import 'routes/routes.dart';

class HomeResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => HomeInjectionModule();

  @override
  RouterModule? get routerModule => HomeRouterModule();
}
