// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutterfire_template/app/app_prefs.dart';
import 'package:flutterfire_template/resources/color_manager.dart';
import 'package:flutterfire_template/resources/font_manager.dart';
import 'package:flutterfire_template/resources/styles_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

//@RoutePage()
class LoginPage extends StatefulWidget {
  final Function(bool?) onResult; // logged in?
  const LoginPage({super.key, required this.onResult});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();

  _login() async {
    widget.onResult.call(true); //* Successful login

    AppPreferences appPreferences =
        AppPreferences(await SharedPreferences.getInstance());
    appPreferences.setIsUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Login",
            style: Theme.of(context).textTheme.headlineLarge,
          )),
      body: SafeArea(
        child: Center(
            child: ElevatedButton(
          onPressed: _login,
          child: Text("Authorize",
              style: getRegularStyle(
                  color: ColorManager.white, fontSize: FontSize.s16)),
        )),
      ),
    );
  }
}
