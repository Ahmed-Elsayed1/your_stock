// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/search/data/data.dart' as _i461;
import '../../features/search/data/data_source/remote/search_data_source.dart'
    as _i683;
import '../../features/search/domain/repository/search_repository.dart'
    as _i535;
import '../../features/search/presentations/cubit/search_cubit.dart' as _i703;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt $initCommonDependenciesGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i683.SearchDataSource>(() => _i683.SearchDataSource());
    gh.factory<_i703.SearchCubit>(() => _i703.SearchCubit());
    gh.factory<_i535.SearchRepository>(
        () => _i535.SearchRepository(gh<_i461.SearchDataSource>()));
    return this;
  }
}
