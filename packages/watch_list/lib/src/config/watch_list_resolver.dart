import 'package:your_stock_core/your_stock_core.dart';

import 'di/di.dart';
import 'routes/routes.dart';

class WatchListResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => WatchListInjectionModule();

  @override
  RouterModule? get routerModule => WatchListRouterModule();
}
