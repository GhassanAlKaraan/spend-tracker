import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';

class InvalidRoute extends StatelessWidget {
  const InvalidRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        appBarTitle: AppStrings.invalidRoute,
        hasDrawer: false,
        child: Center(
          child: Text(AppStrings.invalidRoute),
        ));
  }
}
