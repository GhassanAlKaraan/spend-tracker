import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_tracker/models/record_model.dart';
import 'package:spend_tracker/pages/records/add_record.dart';
import 'package:spend_tracker/pages/records/edit_record.dart';
import 'package:spend_tracker/pages/records/records_page.dart';
import 'package:spend_tracker/pages/splash/splash_page.dart';
import 'package:spend_tracker/pages/system/invalid_route.dart';

bool isLoggedIn = true; //TODO: User is always logged in.

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
          transitionDuration: const Duration(seconds: 2),
          fullscreenDialog: true,
          key: state.pageKey,
          child: const RecordsPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
          pageBuilder: (context, state) {
            RecordModel record = state.extra as RecordModel;
            return CustomTransitionPage(
              transitionDuration: const Duration(seconds: 1),
              fullscreenDialog: true,
              key: state.pageKey,
              child: EditRecord(
                record: record,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                Offset begin = Offset(-1.0, 0.0); // start position
                Offset end = Offset.zero; // end position
                var curve = Curves.easeInOutCirc;

                var tween = Tween<Offset>(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: RoutePaths.addRecord,
          name: RouteNames.addRecord,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(seconds: 1),
              fullscreenDialog: true,
              key: state.pageKey,
              child: AddRecord(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                Offset begin = Offset(1.0, 0.0); // start position
                Offset end = Offset.zero; // end position
                var curve = Curves.easeInOutCirc;

                var tween = Tween<Offset>(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    )
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
