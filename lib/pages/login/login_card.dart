import 'package:flutter/material.dart';
import 'package:spend_tracker/app/functions.dart';
import 'package:spend_tracker/resources/color_manager.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class LoginCard extends StatelessWidget {

  final Function() authorize;

  LoginCard({super.key, required this.authorize});
  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async{
    // loading not implemented
    if (_formKey.currentState!.validate()) {
      //TODO: Login logic.
      
      // This athenticates the user and updates the shared preferences.
      await authorize();
      
    }
  }


  String? _validateEmail(String? email) {
    if (email == null ||
        email.isEmpty ||
        !email.contains('@') ||
        !isEmailValid(email)) {
      return AppStrings.invalidEmailError;
    }
    return null; // Return null if the input is valid
  }

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return AppStrings.invalidPasswordError;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s14)),
        elevation: 1,
        color: ColorManager.background,
        margin:
            const EdgeInsets.all(AppMargin.m8), // Adjust the margin as needed
        child: Padding(
          padding: const EdgeInsets.all(
              AppPadding.p20), // Adjust padding for content inside Card
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Use minimum space
              children: [
                const SizedBox(height: AppSize.s20),
                Icon(
                  Icons.lock,
                  size: AppSize.s120,
                  color: ColorManager.primary,
                ),
                const SizedBox(height: AppSize.s20),
                Text(
                  AppStrings.loginMessage,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSize.s20),
                TextFormField(
                  controller: _emailController,
                  validator: _validateEmail,
                  obscureText: false,
                  // maxLength: 25,
                  maxLines: 1,
                  decoration:
                      const InputDecoration(labelText: AppStrings.emailHint),
                ),
                const SizedBox(
                    height: AppSize.s16), // Space between the text fields
                TextFormField(
                  controller: _passwordController,
                  validator: _validatePassword,
                  obscureText: true,
                  // maxLength: 25,
                  maxLines: 1,
                  decoration:
                      const InputDecoration(labelText: AppStrings.passwordHint),
                ),
                const SizedBox(height: 35), // Space before the button
                ElevatedButton(
                  onPressed: _login,
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text(AppStrings.loginButton),
                ),
                const SizedBox(height: AppSize.s25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
