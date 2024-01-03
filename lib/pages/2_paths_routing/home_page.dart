import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/color_manager.dart';
import 'package:flutterfire_template/resources/font_manager.dart';
import 'package:flutterfire_template/resources/routes_manager/1_navbar_routing/app_router.gr.dart';
import 'package:flutterfire_template/resources/styles_manager.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Home",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  context.router.replace(const BookListRoute());
                },
                child: Text(
                  "Go to Book List",
                  style: getRegularStyle(
                      color: ColorManager.white, fontSize: FontSize.s16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
