import 'package:auto_route/auto_route.dart';
import 'package:spend_tracker/app/app_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spend_tracker/resources/routes_manager/app_router.gr.dart';


class AuthGard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final AppPreferences appPreferences = AppPreferences(await SharedPreferences.getInstance());

    bool loggedIn = await appPreferences.isUserLoggedIn();
    if (loggedIn) {
      resolver.next(true);
    } else {
      await router.push(
        LoginRoute(onResult: (result) async {
          if (result == true) {
            // go to specified route
            resolver.next(true);
            // remove login from this route
            router.removeLast();
          } else {
            // error handling
          }
        }),
      );
    }
  }
}
