import 'dart:async';

import 'package:your_stock_core/your_stock_core.dart';

import 'settings_injection_container.dart';

class SettingsInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies(
          {required GetIt injector, required BuildConfig buildConfig}) =>
      configureSettingsDependencies(injector, buildConfig.enviroment);
}
