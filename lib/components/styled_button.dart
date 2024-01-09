import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/color_manager.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed, super.key});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: ColorManager.primary)),
        onPressed: onPressed,
        child: child,
      );
}
