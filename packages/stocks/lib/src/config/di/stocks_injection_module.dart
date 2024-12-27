import 'dart:async';

import 'package:your_stock_core/your_stock_core.dart';

import 'stocks_injection_container.dart';

class StocksInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies(
          {required GetIt injector, required BuildConfig buildConfig}) =>
      configureStocksDependencies(injector, buildConfig.enviroment);
}
