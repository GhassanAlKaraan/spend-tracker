// ignore_for_file: constant_identifier_names

import 'package:auto_route/auto_route.dart';
import 'package:flutterfire_template/resources/routes_manager/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LOGIN_PREF_KEY = 'logged_in'; // value: bool

class AuthGard extends AutoRouteGuard {
  // LOGIN GUARD
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    bool loggedIn = sharedPreferences.getBool(LOGIN_PREF_KEY) ?? false;
    if (loggedIn) {
      resolver.next(true);
    } else {
      router.push(LoginRoute(onResult: (result) async {
        if (result == true) {
          // go to specified route
          resolver.next(true);
          //remove login from this route
          router.removeLast();
        }
      }));
    }
  }
}
