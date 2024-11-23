import 'dart:async';

import 'package:your_stock_core/your_stock_core.dart';

import 'news_injection_container.dart';

class NewsInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies(
          {required GetIt injector, required BuildConfig buildConfig}) =>
      configureNewsDependencies(injector, buildConfig.enviroment);
}
