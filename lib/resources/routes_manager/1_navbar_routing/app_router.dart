import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';
import 'guard/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // Bottom Nav Bar Page
        AutoRoute(
          page: BottomNavBarRoute.page,
          initial: true,
          children: [
            AutoRoute(page: Route1.page), // Page1
            AutoRoute(page: Route2.page), // Page2
            AutoRoute(page: Route3.page), // Page3
          ],
        ),
        // add more here
        AutoRoute(page: Route4.page, guards: [AuthGard()]),
        AutoRoute(page: LoginRoute.page),
      ];
}
