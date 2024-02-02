import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spend_tracker/app/app_prefs.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/pages/login/login_card.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  final Function(bool?) onResult;

  void setAuthenticated() async {
    onResult.call(true);

    AppPreferences appPreferences =
        AppPreferences(await SharedPreferences.getInstance());
    //TODO: Set auth token
    appPreferences.setIsUserLoggedIn();
  }

  const LoginPage({super.key, required this.onResult});
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      barTitle: AppStrings.loginPageTitle,
      hasDrawer: false,
      child: LoginCard(authenticate: setAuthenticated),
    );
  }
}
