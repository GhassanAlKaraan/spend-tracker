// ignore_for_file: avoid_print
// TODO: custom file to be refactored

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spend_tracker/pages/login/v2_login_success.dart';
import 'package:spend_tracker/services/http_login_service.dart';

class LoginCard2 extends StatefulWidget {
  const LoginCard2({super.key});

  @override
  State<LoginCard2> createState() => _LoginCard2State();
}

class _LoginCard2State extends State<LoginCard2> {
  late SharedPreferences prefs;
  // late String token;

  _initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    // token = prefs.getString('token') ?? "";
  }

  @override
  void initState() {
    super.initState();
    _initSharedPrefs();
  }

  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  // Service
  MyHttpService service = MyHttpService();

  void _debugLogin(context) async {
    String username = "kminchelle";
    String password = "0lelplR";

    try {
      bool result = await service.login(username, password);

      if (result == true) {
        String token = prefs.getString('token') ?? "";
        if (token.isNotEmpty) {
          final snackBar = SnackBar(
            content: const Text('Auto logged in'),
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Display the snackbar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginSuccessPage(token: token)),
          );
        } else {
          print('Token is empty for some reason');
        }
      } else {
        print('Creds invalid');
      }
    } catch (e) {
      print('Login Failed HERE');
    }
  }

  void _login(context) async {
    // eza kello tamem
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();

      try {
        bool result = await service.login(username, password);

        if (result == true) {
          String token = prefs.getString('token') ?? "";
          if (token.isNotEmpty) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginSuccessPage(token: token)),
            );
          } else {
            print('Fi meshekle bl token ya baba');
          }
        } else {
          print('Creds invalid');
        }
      } catch (e) {
        print('Login Failed HERE');
      }
    }
  }

  String? _validateEmail(String? username) {
    if (username == null || username.isEmpty) {
      return 'Invalid Username';
    }
    return null; // Return null if the input is valid
  }

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Invalid Password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          elevation: 1,
          margin: const EdgeInsets.all(8), // Adjust the margin as needed
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min, // Use minimum space
                children: [
                  const SizedBox(height: 20),
                  const Icon(
                    Icons.lock,
                    size: 120,
                    color: Colors.indigo,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _usernameController,
                    validator: _validateEmail,
                    obscureText: false,
                    // maxLength: 25,
                    maxLines: 1,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  const SizedBox(height: 16), // Space between the text fields
                  TextFormField(
                    controller: _passwordController,
                    validator: _validatePassword,
                    obscureText: true,
                    // maxLength: 25,
                    maxLines: 1,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(height: 35), // Space before the button
                  ElevatedButton(
                    onPressed: () {
                      _login(context);
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 35), // Space before the button
                  ElevatedButton(
                    onPressed: () {
                      _debugLogin(context);
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Text('Debug Login'),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
