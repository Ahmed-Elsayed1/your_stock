import '../start_app.dart';
import 'production_build_config.dart';

class ProductionApp extends StartApp {
  ProductionApp() : super(buildConfig: ProductionBuildConfig());
}

Future<void> main() => ProductionApp().startApp();
