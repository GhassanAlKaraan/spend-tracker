import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spend_tracker/app/app_prefs.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/pages/login/login_card.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';

class LoginPage extends StatelessWidget {
  final Function(bool?) onResult;

  void setAuthorized() async {
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
      appBarTitle: AppStrings.loginPageTitle,
      hasDrawer: false,
      child: LoginCard(authorize: setAuthorized),
    );
  }
}
