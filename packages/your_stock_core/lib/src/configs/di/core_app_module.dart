import 'package:your_stock_core/your_stock_core.dart';

@module
abstract class CoreAppModule {
  @injectable
  Uuid getUuid() => const Uuid();
}
