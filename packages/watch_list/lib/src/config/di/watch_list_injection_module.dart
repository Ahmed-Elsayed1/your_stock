import 'dart:async';

import 'package:your_stock_core/your_stock_core.dart';

import 'watch_list_injection_container.dart';

class WatchListInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies(
          {required GetIt injector, required BuildConfig buildConfig}) =>
      configureWatchListDependencies(injector, buildConfig.enviroment);
}
