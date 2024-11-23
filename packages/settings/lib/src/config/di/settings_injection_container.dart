import 'dart:async';

import 'package:your_stock_core/your_stock_core.dart';

import 'settings_injection_container.config.dart';

/// Dependency Injection In Multi-Module Flutter Project
/// https://abdulhakeemahmoood.medium.com/dependency-injection-in-multi-module-flutter-project-a2bbf99b14ff
@InjectableInit(
  initializerName: r'$initSettingsDependenciesGetIt', // default
  preferRelativeImports: true, // default
)
FutureOr<void> configureSettingsDependencies(GetIt getIt, String? enviroment) =>
    getIt.$initSettingsDependenciesGetIt(environment: enviroment);
