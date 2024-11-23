import 'package:your_stock_core/your_stock_core.dart';

import 'di/di.dart';
import 'routes/routes.dart';

class SettingsResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => SettingsInjectionModule();

  @override
  RouterModule? get routerModule => SettingsRouterModule();
}
