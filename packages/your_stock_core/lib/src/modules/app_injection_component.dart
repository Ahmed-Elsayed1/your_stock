import 'package:your_stock_core/src/configs/build_config.dart';
import 'package:your_stock_core/src/configs/di/core_injection_container.dart';

import 'injection_module.dart';

class AppInjectionComponent {
  AppInjectionComponent._();

  static AppInjectionComponent instance = AppInjectionComponent._();

  Future<void> registerModules({
    required List<InjectionModule> modules,
    required BuildConfig config,
  }) async {
    for (final module in modules) {
      await module.registerDependencies(
        injector: getIt,
        buildConfig: config,
      );
    }
  }
}
