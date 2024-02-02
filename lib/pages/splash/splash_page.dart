// ignore_for_file: unused_field

import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/assets_manager.dart';
import 'package:spend_tracker/resources/color_manager.dart';
import 'package:spend_tracker/resources/routes_manager/app_router.gr.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), () => _goNext());
  }

  _goNext() {
    AutoRouter.of(context).replace(const HomeRoute());
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
