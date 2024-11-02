import 'dart:async';

import 'package:your_stock_core/your_stock_core.dart';

import 'home_injection_container.dart';

class HomeInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies(
          {required GetIt injector, required BuildConfig buildConfig}) =>
      configureHomeDependencies(injector, buildConfig.enviroment);
}
