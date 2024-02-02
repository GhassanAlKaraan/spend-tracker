import 'package:flutter/material.dart';

//@RoutePage()
class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Page 3",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}