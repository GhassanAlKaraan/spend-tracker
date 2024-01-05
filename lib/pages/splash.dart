// ignore_for_file: unused_field

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/assets_manager.dart';
import 'package:flutterfire_template/resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), () => _goNext());
  }

  _goNext() { //TODO: use auto router to navigate to home.
    // Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(
          ImageAssets.splashLogo,
        ),
      ),
    );
  }
}
