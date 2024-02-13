import 'package:flutter/material.dart';
import 'package:spend_tracker/pages/records/add_record_card.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';


class AddRecord extends StatelessWidget {
  // const EditRecord({super.key, required this.details,  @PathParam('id') required this.id});
  const AddRecord({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: AppStrings.addRecordTitle,
      hasDrawer: false,
      child: AddRecordCard(onSave: (Map<String, dynamic> newDetails) {
        //TODO use create new method in provider
      
      }),
    );
  }
}
