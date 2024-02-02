import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/color_manager.dart';
import 'package:flutterfire_template/resources/strings_manager.dart';
import '../resources/values_manager.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});
  // TODO: Refactor
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s14)),
        elevation: 1,
        color: ColorManager.background,
        margin: const EdgeInsets.all(AppMargin.m8), // Adjust the margin as needed
        child: Padding(
          padding:
              const EdgeInsets.all(AppPadding.p20), // Adjust padding for content inside Card
          child: Column(
            mainAxisSize: MainAxisSize.min, // Use minimum space
            children: [
              const SizedBox(height: 20),
              Icon(Icons.lock, size: 120, color: ColorManager.primary,),
              const SizedBox(height: 20),
              Text("Login to continue", style: Theme.of(context).textTheme.titleMedium,),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: AppStrings.emailHint, // Label for the first text field
                ),
              ),
              const SizedBox(height: 16), // Space between the text fields
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: AppStrings.passwordHint, // Label for the second text field
                ),
              ),
              const SizedBox(height: 35), // Space before the button
              ElevatedButton(
                onPressed: () {},
                style: Theme.of(context).elevatedButtonTheme.style,
                child: const Text(AppStrings.loginButton),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
