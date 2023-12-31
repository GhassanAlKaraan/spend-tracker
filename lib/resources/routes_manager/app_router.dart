import 'package:auto_route/auto_route.dart';
import 'package:flutterfire_template/resources/routes_manager/guard/auth_gard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        //! Bottom Navigation Page
        AutoRoute(page: MainRoute.page, initial: true, children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: RegisterRoute.page),
          AutoRoute(page: LoginRoute.page),
        ]),

        // Auth Routes
        AutoRoute(page: ProfileRoute.page, guards: [AuthGard()]),
        //AutoRoute(page: RegisterRoute.page),

        // Protected Route
        //AutoRoute(page: ProfileRoute.page, guards: [AuthGard()]),

        // Initial Route
        //AutoRoute(page: HomeRoute.page, initial: true),
      ];
}
