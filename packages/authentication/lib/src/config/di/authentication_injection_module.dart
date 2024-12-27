import 'dart:async';

import 'package:your_stock_core/your_stock_core.dart';

import 'authentication_injection_container.dart';

class AuthenticationInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies(
          {required GetIt injector, required BuildConfig buildConfig}) =>
      configureAuthenticationDependencies(injector, buildConfig.enviroment);
}
