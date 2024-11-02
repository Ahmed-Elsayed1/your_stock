import '../start_app.dart';
import 'sandbox_build_config.dart';

class SandBoxApp extends StartApp {
  SandBoxApp() : super(buildConfig: SandBoxBuildConfig());
}

Future<void> main() => SandBoxApp().startApp();
