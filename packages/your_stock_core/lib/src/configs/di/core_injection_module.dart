import 'dart:async';

import 'package:get_it/get_it.dart';

import '../../modules/modules.dart';
import '../configs.dart';

class CoreInjectionModule extends InjectionModule {
  @override
  FutureOr<void> registerDependencies(
      {required GetIt injector, required BuildConfig buildConfig}) async {
    return await configureCoreDependencies(injector);
  }
}
