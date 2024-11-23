import 'package:your_stock_core/your_stock_core.dart';

import 'di/di.dart';
import 'routes/routes.dart';

class NewsResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => NewsInjectionModule();

  @override
  RouterModule? get routerModule => NewsRouterModule();
}
