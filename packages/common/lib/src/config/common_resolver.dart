import 'package:your_stock_core/your_stock_core.dart';

import 'di/di.dart';
import 'routes/routes.dart';

class CommonResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => CommonInjectionModule();

  @override
  RouterModule? get routerModule => CommonRouterModule();
}
