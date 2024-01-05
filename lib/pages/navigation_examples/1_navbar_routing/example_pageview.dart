import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/routes_manager/navigation_examples/1_navbar_routing/app_router.gr.dart';

//@RoutePage()
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // we'll use [AutoTabsRouter.pageView] to render pageview
    return AutoTabsRouter.pageView(
      routes: const [
        AudioRoute(),
        VideoRoute(),
      ],
      builder: (context, child, _) {
        // ignore: unused_local_variable
        final tabsRouter = AutoTabsRouter.of(context);
        
        // [ScaffoldWithNavbar] is just a widget create that contains a [BottomNavigationBarItem]
        // USE THIS CUSTOM WIDGET: return ScaffoldWithNavbar(tabsRouter, child);
        return const Scaffold(); // dummy code here to remove red errors
      },
    );
  }
}
