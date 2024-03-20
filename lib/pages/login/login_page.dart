import 'package:flutter/material.dart';
import 'package:spend_tracker/pages/login/v2_login_card_2.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';

class LoginPage extends StatelessWidget {
  // final Function(bool?) onResult;

  // void setAuthorized() async {
  //   onResult.call(true);

  //   AppPreferences appPreferences =
  //       AppPreferences(await SharedPreferences.getInstance());
  //   appPreferences.setIsUserLoggedIn();
  // }

  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: AppStrings.loginPageTitle,
      hasDrawer: false,
      child: 
      
      // LoginCard(authorize: setAuthorized),
      LoginCard2()


    );
  }
}
