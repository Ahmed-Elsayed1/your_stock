// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:authentication/src/features/login/presentations/screens/login_screen.dart'
    as _i1;
import 'package:authentication/src/features/registeration/presentations/screens/registeration_screen.dart'
    as _i2;
import 'package:authentication/src/features/splash/presentations/screens/splash_screen.dart'
    as _i3;
import 'package:authentication/src/features/verification/presentations/screens/verification_screen.dart'
    as _i4;
import 'package:auto_route/auto_route.dart' as _i5;

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.LoginScreen();
    },
  );
}

/// generated route for
/// [_i2.RegisterationScreen]
class RegisterationRoute extends _i5.PageRouteInfo<void> {
  const RegisterationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RegisterationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterationRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.RegisterationScreen();
    },
  );
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashScreen();
    },
  );
}

/// generated route for
/// [_i4.VerificationScreen]
class VerificationRoute extends _i5.PageRouteInfo<void> {
  const VerificationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          VerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.VerificationScreen();
    },
  );
}
