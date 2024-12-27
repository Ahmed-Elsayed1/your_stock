import 'package:your_stock_core/your_stock_core.dart';

import 'di/di.dart';
import 'routes/routes.dart';

class StocksResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => StocksInjectionModule();

  @override
  RouterModule? get routerModule => StocksRouterModule();
}
