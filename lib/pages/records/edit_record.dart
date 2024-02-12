import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';

import 'edit_record_card.dart';


class EditRecord extends StatelessWidget {
  // const EditRecord({super.key, required this.details,  @PathParam('id') required this.id});
  const EditRecord({super.key, required this.details}); // take index
  final Map<String, dynamic> details; // take the details map to populate fields

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: AppStrings.editRecordTitle,
      hasDrawer: false,
      child: EditRecordCard(record: details, onSave: (Map<String, dynamic> newDetails) {
        //TODO update the record in the provider list
        // Notify UI of updated list
        // setState(() {});
      
      }),
    );
  }
}
