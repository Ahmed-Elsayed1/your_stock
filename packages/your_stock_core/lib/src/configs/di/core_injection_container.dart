import 'package:your_stock_core/src/configs/di/core_injection_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

///this must be used in all modules to get the injection
GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initCoreGetIt', // default
  preferRelativeImports: true, // default
)
configureCoreDependencies(GetIt getItInstance, {String? environment}) =>
    getItInstance.$initCoreGetIt(environment: environment);
