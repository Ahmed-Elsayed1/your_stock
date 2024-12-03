import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:home/home.dart';
import 'package:news/news.dart';
import 'package:stocks/stocks.dart';
import 'package:watch_list/watch_list.dart';
import 'package:settings/settings.dart';
import 'package:common/common.dart';
import 'package:your_stock_core/your_stock_core.dart';

import 'package:authentication/authentication.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';
import '../firebase_options.dart';
import '../src/app.dart';
import '../src/shared/bloc_observer.dart';

abstract class StartApp {
  final BuildConfig buildConfig;
  final AppFeaturesBuilder appFeaturesBuilder;

  StartApp({
    required this.buildConfig,
  }) : appFeaturesBuilder = AppFeaturesBuilder(
          featureResolvers: [
            CoreResolver(),
            AuthenticationResolver(),
            CommonResolver(),
            HomeResolver(),
            NewsResolver(),
            SettingsResolver(),
            StocksResolver(),
            WatchListResolver(),
            // Navigation
          ],
        );

  Future<void> startApp() async {
    await runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ));

        //init injections
        await AppInjectionComponent.instance.registerModules(
          config: buildConfig,
          modules: appFeaturesBuilder.injectionModule,
        );

        await Firebase.initializeApp(
          name: "your_stock",
          options: DefaultFirebaseOptions.currentPlatform,
        );

        Bloc.observer = MyBlocObserver();

        debugPrintGestureArenaDiagnostics = false;

        runApp(
          App(
            featuresBuilder: appFeaturesBuilder,
          ),
        );
      },
      (error, stack) {
        throw error;
      },
    );
  }
}
