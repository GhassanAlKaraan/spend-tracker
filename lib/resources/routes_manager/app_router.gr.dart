// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutterfire_template/pages/bottom_nav_bar_page.dart' as _i1;
import 'package:flutterfire_template/pages/login_page.dart' as _i2;
import 'package:flutterfire_template/pages/page_1.dart' as _i3;
import 'package:flutterfire_template/pages/page_2.dart' as _i4;
import 'package:flutterfire_template/pages/page_3.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    BottomNavBarRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BottomNavBarPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LoginPage(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    Route1.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Page1(),
      );
    },
    Route2.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Page2(),
      );
    },
    Route3.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Page3(),
      );
    },
  };
}

/// generated route for
/// [_i1.BottomNavBarPage]
class BottomNavBarRoute extends _i6.PageRouteInfo<void> {
  const BottomNavBarRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i7.Key? key,
    required dynamic Function(bool?) onResult,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<LoginRouteArgs> page =
      _i6.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onResult,
  });

  final _i7.Key? key;

  final dynamic Function(bool?) onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i3.Page1]
class Route1 extends _i6.PageRouteInfo<void> {
  const Route1({List<_i6.PageRouteInfo>? children})
      : super(
          Route1.name,
          initialChildren: children,
        );

  static const String name = 'Route1';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Page2]
class Route2 extends _i6.PageRouteInfo<void> {
  const Route2({List<_i6.PageRouteInfo>? children})
      : super(
          Route2.name,
          initialChildren: children,
        );

  static const String name = 'Route2';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.Page3]
class Route3 extends _i6.PageRouteInfo<void> {
  const Route3({List<_i6.PageRouteInfo>? children})
      : super(
          Route3.name,
          initialChildren: children,
        );

  static const String name = 'Route3';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
