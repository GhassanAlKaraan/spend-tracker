import 'package:flutter/material.dart';
import 'package:spend_tracker/models/record_model.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';

import 'edit_record_card.dart';


class EditRecord extends StatelessWidget {
  // const EditRecord({super.key, required this.details,  @PathParam('id') required this.id});
  const EditRecord({super.key, required this.record}); // take index
  final RecordModel record; // take the details map to populate fields

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: AppStrings.editRecordTitle,
      hasDrawer: false,
      child: EditRecordCard(record: record, onSave: (RecordModel newRecord) {
        //TODO use update record method from provider
      
      }),
    );
  }
}
