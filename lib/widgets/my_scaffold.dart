import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/color_manager.dart';
import 'package:spend_tracker/resources/font_manager.dart';
import 'package:spend_tracker/resources/values_manager.dart';
import 'package:spend_tracker/widgets/my_drawer.dart';
import 'package:spend_tracker/widgets/my_fab.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    super.key,
    required this.appBarTitle,
    this.customActions,
    this.child,
    required this.hasDrawer,
    this.fab
  });

  final String appBarTitle;
  final IconButton? customActions;
  final bool hasDrawer;
  final MyFAB? fab;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      floatingActionButton: fab ?? Container(),
      drawer: hasDrawer ? const MyDrawer() : null,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        foregroundColor: ColorManager.background,
        centerTitle: true,
        actions: [if (customActions != null) customActions!],
        title: Text(
          appBarTitle.toUpperCase(),
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
