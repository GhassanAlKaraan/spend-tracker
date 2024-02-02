// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/strings_manager.dart';
import 'package:flutterfire_template/resources/values_manager.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
 // Define a global key for the form
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed with the login logic
      print('Email: ${_emailController.text}, Password: ${_passwordController.text}');
    }
  }

  // void _recoverPassword() {
  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty || !email.contains('@')) {
      return AppStrings.invalidEmailError;
    }
    return null; // Return null if the input is valid
  }

  String? _validatePassword(String? password){
    if(password == null || password.isEmpty){
      return AppStrings.invalidPasswordError;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.loginScreenTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: Form(
          key: _formKey, // Associate your form with the global key
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: AppStrings.emailHint,
                ),
                validator: _validateEmail, // Use the validator function for email
              ),
              const SizedBox(height: AppSize.s8),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: AppStrings.passwordHint,
                ),
                validator: _validatePassword,
                // You can add validation for password as well if needed
              ),
              const SizedBox(height: AppSize.s20),
              ElevatedButton(
                onPressed: _login,
                child: const Text(AppStrings.loginButton),
              ),
              // TextButton(
              //   onPressed: _recoverPassword,
              //   child: const Text(AppStrings.forgotPassword),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
