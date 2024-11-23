import 'dart:async';

import 'package:your_stock_core/your_stock_core.dart';

import 'common_injection_container.dart';

class CommonInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies(
          {required GetIt injector, required BuildConfig buildConfig}) =>
      configureCommonDependencies(injector, buildConfig.enviroment);
}
