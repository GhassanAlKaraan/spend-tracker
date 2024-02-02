import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/color_manager.dart';
import 'package:spend_tracker/resources/values_manager.dart';

class MyFAB extends StatelessWidget {
  final Function()? onPressed;

  const MyFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: ColorManager.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(RadiusConstant.r18)),
      ),
      child: Icon(
        Icons.add,
        color: ColorManager.white,
      ), // Example icon
    );
  }
}
