import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_fab.dart';
import 'package:spend_tracker/pages/records/records_listview.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';

@RoutePage()
class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      barTitle: AppStrings.recordsPageTitle,
      hasDrawer: true,
      fab: MyFAB(onPressed: () {}),
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
