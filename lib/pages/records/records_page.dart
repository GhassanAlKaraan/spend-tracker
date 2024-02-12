import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_tracker/resources/app_router.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_fab.dart';
import 'package:spend_tracker/pages/records/records_listview.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';


class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: AppStrings.recordsPageTitle,
      hasDrawer: true,
      fab: MyFAB(onPressed: () {
        context.pushNamed(RouteNames.addRecord);
      }),
      child: Column(
        children: [
          Expanded(
            child: RecordsListView(),
          ),
        ],
      ),
    );
  }
}
