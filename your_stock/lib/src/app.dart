import 'package:authentication/authentication.dart';
import 'package:auto_route/auto_route.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:your_stock_core/your_stock_core.dart' show AppFeaturesBuilder;

class App extends StatefulWidget {
  const App({
    super.key,
    required this.featuresBuilder,
  });

  final AppFeaturesBuilder featuresBuilder;

  @override
  State<App> createState() => _GlobalState();
}

class _GlobalState extends State<App> {
  @override
  Widget build(BuildContext context) {
    MaterialColor primarySwatch = const MaterialColor(
      0xff0e1117,
      <int, Color>{
        50: Color(0xffe8eaf0),
        100: Color(0xffc5cbe9),
        200: Color(0xff9fa8da),
        300: Color(0xff7985cb),
        400: Color(0xff5c6bc0),
        500: Color(0xff3f51b5),
        600: Color(0xff394aae),
        700: Color(0xff3141a5),
        800: Color(0xff29399d),
        900: Color(0xff1b2d86),
      },
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: widget.featuresBuilder.routers.delegate(
        deepLinkBuilder: (deepLink) => Future.value(
          const DeepLink(
            [SplashRoute()],
          ),
        ),
      ),
      routeInformationParser:
          widget.featuresBuilder.routers.defaultRouteParser(),
      title: "Your Stock",
      theme: ThemeData(
        primarySwatch: primarySwatch,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white70,
            statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: primarySwatch,
        scaffoldBackgroundColor: const Color(0xff0e1117),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Color(0xff0e1117),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          backgroundColor: Color(0xff0e1117),
        ),
      ),
      themeMode: ThemeMode.light,
      builder: (context, child) => AppResponsiveTheme(
        child: child ?? Container(),
      ),
    );
  }
}
