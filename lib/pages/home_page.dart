import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/color_manager.dart';
import 'package:flutterfire_template/resources/routes_manager/app_router.gr.dart';
import 'package:flutterfire_template/resources/styles_manager.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.displayLarge
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home Page",
              style: getBoldStyle(color: ColorManager.primary)
                  .copyWith(fontSize: 24)),
          const SizedBox(height: 10),
          TextButton(
              onPressed: () {
                context.router.push(LoginRoute(onResult: (bool? x) {  }));
              },
              child: const Text("Login Page")),
          const SizedBox(height: 10),
          TextButton(
              onPressed: () {
                context.router.push(const RegisterRoute());
              },
              child: const Text("Register Page")),
          const SizedBox(height: 10),
          TextButton(
              onPressed: () {
                context.router.push(const ProfileRoute());
              },
              child: const Text("Go to Profile")),
        ],
      )),
    );
  }
}
