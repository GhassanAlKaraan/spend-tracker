import 'package:flutter/material.dart';

//@RoutePage()
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Page 2",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}