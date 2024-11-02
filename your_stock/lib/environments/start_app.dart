import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:home/home.dart';
import 'package:your_stock_core/your_stock_core.dart';

import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
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
            HomeResolver(),
            AuthenticationResolver(),
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
