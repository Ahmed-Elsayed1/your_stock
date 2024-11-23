// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:common/src/features/search/presentations/screens/search_screen.dart'
    as _i1;
import 'package:flutter/material.dart' as _i3;

/// generated route for
/// [_i1.SearchScreen]
class SearchRoute extends _i2.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i3.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<SearchRouteArgs>(orElse: () => const SearchRouteArgs());
      return _i1.SearchScreen(key: args.key);
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final _i3.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}
