import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';

import 'edit_record_card.dart';


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
      child: EditRecordCard(record: details, onSave: (Map<String, dynamic> newDetails) {
        //TODO update the record in the provider list
      
        // here the function must update the record with newDetails
        // but where's the record? in the list of records.
        // where's the list of records? in the provider class
        // when first fetched, the list in provided must get populated from the api response
        //! TODO: implement provider ASAP
        //? This code should be used on the records page to notify UI and update list
        //? but isn't it done by provider? yes... yeah I should learn a lot more about it.
        // Notify UI of updated list
        // setState(() {});
      
      }),
    );
  }
}
