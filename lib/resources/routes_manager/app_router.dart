import 'package:auto_route/auto_route.dart';
import 'package:flutterfire_template/resources/routes_manager/guard/auth_gard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [

        // Auth Routes
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        
        // Protected Route
        AutoRoute(page: ProfileRoute.page, guards: [AuthGard()]),

        // Initial Route
        AutoRoute(page: HomeRoute.page, initial: true),
      ];
}
