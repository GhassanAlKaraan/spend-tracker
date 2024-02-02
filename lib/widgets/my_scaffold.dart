import 'package:flutter/material.dart';
import 'package:flutterfire_template/resources/color_manager.dart';
import 'package:flutterfire_template/resources/font_manager.dart';
import 'package:flutterfire_template/resources/values_manager.dart';
import 'package:flutterfire_template/widgets/my_drawer.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    super.key,
    required this.barTitle,
    this.customActions,
    this.child,
    bool? hasDrawer,
  }) : hasDrawer = hasDrawer ?? false;

  final String barTitle;
  final IconButton? customActions;
  final bool hasDrawer;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      drawer: hasDrawer ? const MyDrawer() : null,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        foregroundColor: ColorManager.background,
        centerTitle: true,
        actions: [if (customActions != null) customActions!],
        title: Text(
          barTitle.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ColorManager.white,
                fontSize: FontSize.s24,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: child ?? const Text("Empty Scaffold"),
      ),
    );
  }
}
