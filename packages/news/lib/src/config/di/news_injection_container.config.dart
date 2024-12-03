// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/news/data/data.dart' as _i307;
import '../../features/news/data/data_source/remote/news_data_source.dart'
    as _i632;
import '../../features/news/domain/domain.dart' as _i82;
import '../../features/news/domain/repository/news_repository.dart' as _i1049;
import '../../features/news/presentations/cubit/news_cubit.dart' as _i978;
import '../../features/stock_news/data/data.dart' as _i865;
import '../../features/stock_news/data/data_source/remote/stock_news_data_source.dart'
    as _i59;
import '../../features/stock_news/domain/domain.dart' as _i908;
import '../../features/stock_news/domain/repository/stock_news_repository.dart'
    as _i142;
import '../../features/stock_news/presentations/cubit/stock_news_cubit.dart'
    as _i5;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt $initNewsDependenciesGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i632.NewsDataSource>(() => _i632.NewsDataSource());
    gh.factory<_i59.StockNewsDataSource>(() => _i59.StockNewsDataSource());
    gh.factory<_i142.StockNewsRepository>(
        () => _i142.StockNewsRepository(gh<_i865.StockNewsDataSource>()));
    gh.factory<_i5.StockNewsCubit>(
        () => _i5.StockNewsCubit(gh<_i908.StockNewsRepository>()));
    gh.factory<_i1049.NewsRepository>(
        () => _i1049.NewsRepository(gh<_i307.NewsDataSource>()));
    gh.factory<_i978.NewsCubit>(
        () => _i978.NewsCubit(gh<_i82.NewsRepository>()));
    return this;
  }
}
