import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spend_tracker/pages/records/add_record_card.dart';
import 'package:spend_tracker/providers/record_provider.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';
import '../../app/utils.dart' as utils;

class AddRecord extends StatelessWidget {
  const AddRecord({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBarTitle: AppStrings.addRecordTitle,
      hasDrawer: false,
      child: AddRecordCard(onSave: (Map<String, dynamic> newDetails) {
        try {
          Provider.of<RecordProvider>(context, listen: false).addRecord(newDetails);
        } catch (e) {
          utils.showSnackBar(context, 'Something went wrong!');
        }
      }),
    );
  }
}
