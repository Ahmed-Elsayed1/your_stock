// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:news/src/features/news/presentations/screens/news_screen.dart'
    as _i1;

/// generated route for
/// [_i1.NewsScreen]
class NewsRoute extends _i2.PageRouteInfo<void> {
  const NewsRoute({List<_i2.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      return const _i1.NewsScreen();
    },
  );
}
