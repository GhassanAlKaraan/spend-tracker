// ignore_for_file: avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_template/app/app_prefs.dart';
import 'package:flutterfire_template/resources/color_manager.dart';
import 'package:flutterfire_template/resources/font_manager.dart';
import 'package:flutterfire_template/resources/routes_manager/navigation_examples/1_navbar_routing/app_router.gr.dart';
import 'package:flutterfire_template/resources/styles_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

//@RoutePage()
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  AppPreferences? _appPreferences;

  _getAppPrefs() async {
    _appPreferences = AppPreferences(await SharedPreferences.getInstance());
  }

  @override
  void initState() {
    _getAppPrefs();
    if (_appPreferences == null) {
      print("app prefs is null on init");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Page 1",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_appPreferences == null) {
                    print("app prefs is still null");
                    return;
                  }
                  _appPreferences!.logout();
                  print("Logout is done");
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(
                  "Logout",
                  style: getRegularStyle(
                      color: ColorManager.white, fontSize: FontSize.s16),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_appPreferences == null) {
                    print("app prefs is still null");
                    return;
                  }
                  context.router.push(const Route4());
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(
                  "Go to Page 4",
                  style: getRegularStyle(
                      color: ColorManager.white, fontSize: FontSize.s16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
