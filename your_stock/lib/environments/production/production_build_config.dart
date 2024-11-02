import 'package:your_stock_core/your_stock_core.dart';

class ProductionBuildConfig extends BuildConfig {
  @override
  Map<String, dynamic> configs = {'env': '.env.production'};

  @override
  String get enviroment => Environment.prod;
}
