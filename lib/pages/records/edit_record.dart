import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/strings_manager.dart';
import 'package:spend_tracker/widgets/my_scaffold.dart';

@RoutePage()
class EditRecord extends StatelessWidget {
  const EditRecord({super.key, required this.details,  @PathParam('id') required this.id});
final int id;
final Map<String, dynamic> details; // Replace by fromJson Model
  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      barTitle: AppStrings.editRecordTitle,
      hasDrawer: false,
      child: Center(child: Text('Empty')),
      //TODO: Create an editing form
    );
  }
}
