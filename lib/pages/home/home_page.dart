import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_fab.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      barTitle: AppStrings.homePageTitle,
      hasDrawer: true,
      fab: MyFAB(onPressed: (){}),
    );
  }
}
