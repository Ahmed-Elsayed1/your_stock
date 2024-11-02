import 'package:your_stock_core/your_stock_core.dart';
import 'package:flutter/material.dart';

import '../routes/app_router.dart';

class AppFeaturesBuilder {
  final List<FeatureResolver> featureResolvers;
  final AppRouter routers;

  AppFeaturesBuilder({
    required this.featureResolvers,
    GlobalKey<NavigatorState>? navigatorKey,
  }) : routers = AppRouter(
            routers: featureResolvers
                .where((element) => element.routerModule != null)
                .map((e) => e.routerModule!.getRouter)
                .toList(),
            navigatorKey: navigatorKey);

  List<InjectionModule> get injectionModule => featureResolvers
      .where((element) => element.injectionModule != null)
      .map((e) => e.injectionModule!)
      .toList();
}
