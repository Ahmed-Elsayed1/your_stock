// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../your_stock_core.dart' as _i619;
import 'core_app_module.dart' as _i1040;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt $initCoreGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreAppModule = _$CoreAppModule();
    gh.factory<_i619.Uuid>(() => coreAppModule.getUuid());
    return this;
  }
}

class _$CoreAppModule extends _i1040.CoreAppModule {}
