import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/color_manager.dart';
import 'package:flutterfire_template/resources/font_manager.dart';
import 'package:flutterfire_template/resources/styles_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  final Function(bool?) onResult; // logged in?
  const LoginPage({super.key, required this.onResult});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _login() async {
    //! Dummy Login logic
    if (usernameController.text == "username") {
      //! If authenticated, redirect to page

      widget.onResult.call(true); //* Successful login
      // Save in shared preferences
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      sharedPreferences.setBool('logged_in', true);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Wrong credentials')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "LOGIN PAGE",
            style: getMediumStyle(color: ColorManager.darkGrey)
                .copyWith(fontSize: 24),
          )),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You need to Login!",
                style: getMediumStyle(color: ColorManager.darkPrimary)
                    .copyWith(fontSize: FontSize.s22)),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
                hintText: 'Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your password',
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: _login, child: const Text("Go to Profile"))
          ],
        )),
      ),
    );
  }
}
