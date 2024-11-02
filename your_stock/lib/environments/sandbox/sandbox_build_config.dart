import 'package:your_stock_core/your_stock_core.dart';

class SandBoxBuildConfig extends BuildConfig {
  @override
  String get enviroment => Environment.dev;

  @override
  Map<String, dynamic> get configs => {'env': '.env.sandbox'};
}
