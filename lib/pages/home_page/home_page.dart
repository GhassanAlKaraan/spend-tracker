import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/color_manager.dart';
import 'package:flutterfire_template/resources/styles_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: getRegularStyle(color: ColorManager.black),
        ),
      ),
      body: Center(
        child: Text(
          "Home Page", //!
          style: getRegularStyle(color: ColorManager.black),
        ),
      ),
    );
  }
}
