import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spend_tracker/app/app_prefs.dart';
import 'package:spend_tracker/resources/routes_manager/app_router.gr.dart';

import '../resources/color_manager.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  AppPreferences? appPreferences;

  void getAppPrefs() async {
    // Add loading if needed
    appPreferences = AppPreferences(await SharedPreferences.getInstance());
  }

  @override
  void initState() {
    getAppPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // TODO: Refactor
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorManager.primary,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: ColorManager.background,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          appPreferences == null
              ? ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Sign out'),
                  onTap: () {
                    appPreferences!.logout();
                    Navigator.pop(context);
                    AutoRouter.of(context).replace(const HomeRoute());
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
