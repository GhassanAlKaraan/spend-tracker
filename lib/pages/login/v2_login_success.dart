import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

// TODO: custom file to be refactored

class LoginSuccessPage extends StatefulWidget {
  const LoginSuccessPage({required this.token, super.key});

  final String token;

  @override
  State<LoginSuccessPage> createState() => _LoginSuccessPageState();
}

class _LoginSuccessPageState extends State<LoginSuccessPage> {
  late String email;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

    email = jwtDecodedToken['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home',
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Logged in as: $email'),
        ),
      ),
    );
  }
}
