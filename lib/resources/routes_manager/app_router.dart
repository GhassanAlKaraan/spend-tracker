import 'package:auto_route/auto_route.dart';
import 'package:flutterfire_template/resources/routes_manager/guard/auth_guard.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [

        // Bottom Nav Bar Page
        // AutoRoute(
        //   page: MainRoute.page,
        //   initial: true,
        //   children: [
        //     AutoRoute(page: Page1Route.page),
        //     AutoRoute(page: Page2Route.page),
        //     AutoRoute(page: Page3Route.page, guards: [AuthGard()]),
        //   ],
        // ),

        // TODO: Add more routes examples below.

        // 

        //
      ];
}
