// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:flutterfire_template/pages/navigation_examples/1_navbar_routing/bottom_nav_bar_page.dart'
    as _i4;
import 'package:flutterfire_template/pages/navigation_examples/1_navbar_routing/login_page.dart'
    as _i7;
import 'package:flutterfire_template/pages/navigation_examples/1_navbar_routing/page_1.dart' as _i8;
import 'package:flutterfire_template/pages/navigation_examples/1_navbar_routing/page_2.dart' as _i9;
import 'package:flutterfire_template/pages/navigation_examples/1_navbar_routing/page_3.dart'
    as _i10;
import 'package:flutterfire_template/pages/navigation_examples/1_navbar_routing/page_4.dart'
    as _i11;
import 'package:flutterfire_template/pages/navigation_examples/2_paths_routing/book_details_page.dart'
    as _i2;
import 'package:flutterfire_template/pages/navigation_examples/2_paths_routing/book_list_page.dart'
    as _i3;
import 'package:flutterfire_template/pages/navigation_examples/2_paths_routing/home_page.dart'
    as _i6;
import 'package:flutterfire_template/pages/navigation_examples/3_nested_routing/audio_page.dart'
    as _i1;
import 'package:flutterfire_template/pages/navigation_examples/3_nested_routing/feed_page.dart'
    as _i5;
import 'package:flutterfire_template/pages/navigation_examples/3_nested_routing/video_page.dart'
    as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AudioRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AudioPage(),
      );
    },
    BookDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BookDetailsRouteArgs>(
          orElse: () => BookDetailsRouteArgs(id: pathParams.getInt('id')));
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BookDetailsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    BookListRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BookListPage(),
      );
    },
    BottomNavBarRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.BottomNavBarPage(),
      );
    },
    FeedRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.FeedPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.LoginPage(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    Route1.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Page1(),
      );
    },
    Route2.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Page2(),
      );
    },
    Route3.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Page3(),
      );
    },
    Route4.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.Page4(),
      );
    },
    VideoRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.VideoPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AudioPage]
class AudioRoute extends _i13.PageRouteInfo<void> {
  const AudioRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AudioRoute.name,
          initialChildren: children,
        );

  static const String name = 'AudioRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BookDetailsPage]
class BookDetailsRoute extends _i13.PageRouteInfo<BookDetailsRouteArgs> {
  BookDetailsRoute({
    _i14.Key? key,
    required int id,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          BookDetailsRoute.name,
          args: BookDetailsRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'BookDetailsRoute';

  static const _i13.PageInfo<BookDetailsRouteArgs> page =
      _i13.PageInfo<BookDetailsRouteArgs>(name);
}

class BookDetailsRouteArgs {
  const BookDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i14.Key? key;

  final int id;

  @override
  String toString() {
    return 'BookDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.BookListPage]
class BookListRoute extends _i13.PageRouteInfo<void> {
  const BookListRoute({List<_i13.PageRouteInfo>? children})
      : super(
          BookListRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookListRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BottomNavBarPage]
class BottomNavBarRoute extends _i13.PageRouteInfo<void> {
  const BottomNavBarRoute({List<_i13.PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.FeedPage]
class FeedRoute extends _i13.PageRouteInfo<void> {
  const FeedRoute({List<_i13.PageRouteInfo>? children})
      : super(
          FeedRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeedRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i14.Key? key,
    required dynamic Function(bool?) onResult,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i13.PageInfo<LoginRouteArgs> page =
      _i13.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onResult,
  });

  final _i14.Key? key;

  final dynamic Function(bool?) onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i8.Page1]
class Route1 extends _i13.PageRouteInfo<void> {
  const Route1({List<_i13.PageRouteInfo>? children})
      : super(
          Route1.name,
          initialChildren: children,
        );

  static const String name = 'Route1';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Page2]
class Route2 extends _i13.PageRouteInfo<void> {
  const Route2({List<_i13.PageRouteInfo>? children})
      : super(
          Route2.name,
          initialChildren: children,
        );

  static const String name = 'Route2';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.Page3]
class Route3 extends _i13.PageRouteInfo<void> {
  const Route3({List<_i13.PageRouteInfo>? children})
      : super(
          Route3.name,
          initialChildren: children,
        );

  static const String name = 'Route3';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Page4]
class Route4 extends _i13.PageRouteInfo<void> {
  const Route4({List<_i13.PageRouteInfo>? children})
      : super(
          Route4.name,
          initialChildren: children,
        );

  static const String name = 'Route4';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.VideoPage]
class VideoRoute extends _i13.PageRouteInfo<void> {
  const VideoRoute({List<_i13.PageRouteInfo>? children})
      : super(
          VideoRoute.name,
          initialChildren: children,
        );

  static const String name = 'VideoRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
