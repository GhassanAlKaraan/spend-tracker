import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    
    AutoRoute(
      page: FeedRoute.page,
      initial: true,
      path: '/feed',
      children: [
        AutoRoute(page: VideoRoute.page),
        AutoRoute(page: AudioRoute.page)
      ]
    
    ),

    // more here

  ];



}
