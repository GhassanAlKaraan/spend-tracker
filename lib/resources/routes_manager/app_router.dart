import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';
import 'guard/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(path: '/records', page: RecordsRoute.page, guards: [AuthGard()]),
        AutoRoute(path: '/records/:id', page: EditRecord.page, guards: [AuthGard()]),
        AutoRoute(page: LoginRoute.page),
      ];
}
