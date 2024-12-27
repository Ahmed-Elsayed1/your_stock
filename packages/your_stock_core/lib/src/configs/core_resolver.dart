import 'package:your_stock_core/your_stock_core.dart';

import 'di/core_injection_module.dart';

class CoreResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => CoreInjectionModule();

  @override
  RouterModule? get routerModule => null;
}
