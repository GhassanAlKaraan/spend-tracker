import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spend_tracker/pages/records/edit_record_card.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';

@RoutePage()
class EditRecord extends StatelessWidget {
  // const EditRecord({super.key, required this.details,  @PathParam('id') required this.id});
  const EditRecord({super.key, @PathParam('id') required this.id});
final int id;
// final Map<String, dynamic> details;




  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      barTitle: AppStrings.editRecordTitle,
      hasDrawer: false,
      child: Text('$id'),
      // EditRecordCard(record: details, onSave: (details){print('saved details');}),
    );
  }
}
