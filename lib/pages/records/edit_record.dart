import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';

import 'edit_record_card.dart';

@RoutePage()
class EditRecord extends StatelessWidget {
  // const EditRecord({super.key, required this.details,  @PathParam('id') required this.id});
  const EditRecord({super.key, required this.id, required this.details});
  final int id; // take index
  final Map<String, dynamic> details; // take the details map to populate fields

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: AppStrings.editRecordTitle,
      hasDrawer: false,
      child: Column(
        children: [
          Text('$id'),
          const SizedBox(height: 20), //TODO; refactor
          EditRecordCard(record: details, onSave: (details) {}),
        ],
      ),
    );
  }
}
