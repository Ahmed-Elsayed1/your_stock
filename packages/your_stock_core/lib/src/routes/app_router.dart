import 'package:auto_route/auto_route.dart';

class AppRouter extends RootStackRouter {
  AppRouter({required this.routers, super.navigatorKey});

  final List<RootStackRouter> routers;

  @override
  List<AutoRoute> get routes =>
      routers.expand((element) => element.routes).toList();
}
