import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spend_tracker/app/app_prefs.dart';
import 'package:spend_tracker/resources/routes_manager/app_router.gr.dart';
import 'package:spend_tracker/resources/strings_manager.dart';

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
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorManager.primary,
            ),
            child: Text(
              AppStrings.appName,
              style: TextStyle(
                color: ColorManager.background,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              
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
                    AutoRouter.of(context).replace(const RecordsRoute());
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
