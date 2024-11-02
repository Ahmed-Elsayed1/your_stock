import '../routes/routes.dart';
import 'injection_module.dart';

abstract class FeatureResolver {
  RouterModule? get routerModule;

  InjectionModule? get injectionModule;
}
