import 'dart:async';

import 'package:get_it/get_it.dart';

import '../configs/configs.dart';

abstract class InjectionModule {
  FutureOr<void> registerDependencies({
    required GetIt injector,
    required BuildConfig buildConfig,
  });
}
