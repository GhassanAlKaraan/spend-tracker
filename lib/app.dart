import 'package:flutter/material.dart';
import 'package:flutterfire_template/pages/home_page/home_page.dart';
import 'package:flutterfire_template/pages/login_page/login_page.dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
      );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          //! Route 1
          GoRoute(
            path: 'homepage',
            builder: ((BuildContext context, GoRouterState state) =>
                const HomePage()),
          ),
          //! Route 2
          GoRoute(
            path: 'loginpage',
            builder: ((BuildContext context, GoRouterState state) =>
                const LoginPage()),
          ),
          //!
        ],
        path: '/',
      ),
    ],
  );
}
