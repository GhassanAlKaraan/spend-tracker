import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/color_manager.dart';
import 'package:flutterfire_template/resources/styles_manager.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Text("Login Page"),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "GO", //!
                style: getBoldStyle(color: ColorManager.primary),
              )),
        ],
      )),
    );
  }
}
