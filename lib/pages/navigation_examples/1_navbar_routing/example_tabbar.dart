import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/routes_manager/navigation_examples/1_navbar_routing/app_router.gr.dart';

//@RoutePage()
class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // we'll use [AutoTabsRouter.tabBar] to render TabBar
    return AutoTabsRouter.tabBar(
      routes: const [
        AudioRoute(),
        VideoRoute(),
      ],
      builder: (context, child, tabController) {
        // ignore: unused_local_variable
        final tabsRouter = AutoTabsRouter.of(context);

        // [ScaffoldWithTabBar] is just a widget create that contains a [TabBar]
        // USE THIS CUSTOM WIDGET: return ScaffoldWithTabBar(tabsRouter, child, tabController);
        return const Scaffold(); // dummy code here to remove red errors
      },
    );
  }
}