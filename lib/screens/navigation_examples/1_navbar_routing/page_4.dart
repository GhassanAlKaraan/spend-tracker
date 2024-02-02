import 'package:flutter/material.dart';


//@RoutePage()
class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Page 4",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
