import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spend_tracker/providers/record_provider.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import '../resources/color_manager.dart';
import '../app/utils.dart' as utils;

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
            title: const Text('Populate List'),
            onTap: () {
              Provider.of<RecordProvider>(context, listen: false)
                  .populateList();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign out'),
            onTap: () {
              // Less priority
              //TODO: implement appPreferences!.logout();
              context.pop();
              utils.showSnackBar(context, 'Feature not ready yet');
            },
          ),
        ],
      ),
    );
  }
}
