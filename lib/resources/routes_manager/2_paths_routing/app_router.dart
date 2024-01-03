import 'package:auto_route/auto_route.dart';

import  'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(path: '/books', page: BookListRoute.page),
    AutoRoute(path: '/books/:id', page: BookDetailsRoute.page),


// Redirect Example.
//     <AutoRoute> [                    
//      RedirectRoute(path: '/', redirectTo: '/feed'),                    
//      AutoRoute(path: '/feed', page: FeedRoute.page),                    
//  ]

  ];



}
