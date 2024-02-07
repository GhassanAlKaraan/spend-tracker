import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_tracker/pages/records/edit_record.dart';
import 'package:spend_tracker/pages/records/records_page.dart';
import 'package:spend_tracker/pages/splash/splash_page.dart';
import 'package:spend_tracker/pages/system/invalid_route.dart';

bool isLoggedIn = true; //TODO: fix login state

GoRouter goRouter = GoRouter(
  errorBuilder: (context, state) => const InvalidRoute(),
  initialLocation: RoutePaths.splash,
  redirect: (context, state) {
    if (!isLoggedIn) {
      return RoutePaths.login;
    }
    return null;
  },
  routes: [
    GoRoute(
      path: RoutePaths.splash,
      name: RouteNames.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
        path: RoutePaths.records,
        name: RouteNames.records,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 400),
            fullscreenDialog: true,
            key: state.pageKey,
            child: const RecordsPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
        routes: [
          GoRoute(
              path: RoutePaths.editRecord,
              name: RouteNames.editRecord,
              builder: (context, state) {
                Map<String, dynamic> args = state.extra as Map<String, dynamic>;
                return EditRecord(
                  id: args['id']!,
                  details: args['details']!,
                );
              }),
        ])
  ],
);

class RouteNames {
  static const splash = 'splash';

  static const login = 'login';

  static const records = 'records';
  static const editRecord = 'editRecord';
  static const addRecord = 'addRecord';
}

class RoutePaths {
  static const splash = '/';

  static const login = '/login';

  static const records = '/records';
    // children routes
      static const editRecord = 'editRecord';
      static const addRecord = 'addRecord';
}
