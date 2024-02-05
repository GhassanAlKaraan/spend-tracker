// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:spend_tracker/pages/login/login_page.dart' as _i2;
import 'package:spend_tracker/pages/records/edit_record.dart' as _i1;
import 'package:spend_tracker/pages/records/records_page.dart' as _i3;
import 'package:spend_tracker/pages/splash/splash_page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    EditRecord.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EditRecordArgs>(
          orElse: () => EditRecordArgs(id: pathParams.getInt('id')));
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.EditRecord(
          key: args.key,
          id: args.id,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LoginPage(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    RecordsRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.RecordsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.EditRecord]
class EditRecord extends _i5.PageRouteInfo<EditRecordArgs> {
  EditRecord({
    _i6.Key? key,
    required int id,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          EditRecord.name,
          args: EditRecordArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'EditRecord';

  static const _i5.PageInfo<EditRecordArgs> page =
      _i5.PageInfo<EditRecordArgs>(name);
}

class EditRecordArgs {
  const EditRecordArgs({
    this.key,
    required this.id,
  });

  final _i6.Key? key;

  final int id;

  @override
  String toString() {
    return 'EditRecordArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i6.Key? key,
    required dynamic Function(bool?) onResult,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i5.PageInfo<LoginRouteArgs> page =
      _i5.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onResult,
  });

  final _i6.Key? key;

  final dynamic Function(bool?) onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i3.RecordsPage]
class RecordsRoute extends _i5.PageRouteInfo<void> {
  const RecordsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RecordsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecordsRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
