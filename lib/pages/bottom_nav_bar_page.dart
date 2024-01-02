import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/strings_manager.dart';

var navBarItems = const [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.page1NavBarTitle),
  BottomNavigationBarItem(icon: Icon(Icons.wallet), label: AppStrings.page2NavBarTitle),
  BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: AppStrings.page3NavBarTitle),
];

@RoutePage()
class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: const [
          //TODO: implement new routes
        ],
        builder: (context, child) {
          // TABS ROUTER : controller for the bottom nav bar
          final tabsRouter = AutoTabsRouter.of(context);

          return Scaffold(
            body: child, // each route
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex, 
                items: navBarItems,
                onTap: (value) { // change page using controller
                tabsRouter.setActiveIndex(value); 
              },
            ),
          );
        });
  }
}
