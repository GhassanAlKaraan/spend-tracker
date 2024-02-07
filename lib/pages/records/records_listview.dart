import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_tracker/resources/app_router.dart';
import 'package:spend_tracker/resources/color_manager.dart';
import 'package:spend_tracker/resources/values_manager.dart';



  // TODO: populate the records when this widget is built.
  final List<Map<String, dynamic>> items = [
    {
      'id': 1,
      'type': 'Family',
      'subType': 'House',
      'description': 'Dinner at house',
      'amount': 100000,
      'currency': 'LBP',
      'dateCreated': '4-2-2024',
    },
    {
      'id': 2,
      'type': 'Food',
      'subType': 'Meal',
      'description': 'Sandwich Lunch',
      'amount': 5.5,
      'currency': 'USD',
      'dateCreated': '1-2-2024',
    },
    {
      'id': 3,
      'type': 'Activity',
      'subType': '',
      'description': '',
      'amount': 20,
      'currency': 'USD',
      'dateCreated': '20-1-2024',
    },
  ];

class RecordsListView extends StatelessWidget {

  RecordsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {

        // to be passed to each book
        final Map<String, dynamic> item = items[index];
        final int id = index + 1;
        //
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p4),
          child: ListTile(
            shape: Border(
              left: BorderSide(
              width: 10.0,
              color: ColorManager.primary,
              ),
              bottom: BorderSide(
              width: 1.0,
              color: ColorManager.primary,
              ),
              top: BorderSide(
              width: 1.0,
              color: ColorManager.primary,
              ),
              right: BorderSide(
              width: 1.0,
              color: ColorManager.primary,
              ),
            ),
            leading: Text(item['id'].toString(), style: Theme.of(context).textTheme.displayLarge,),
            title: Text(item['type'], style: Theme.of(context).textTheme.titleMedium,),
            subtitle: Text('${item['subType']} - ${item['description']}', style: Theme.of(context).textTheme.titleSmall,),
            trailing: Text('${item['amount'].toString()} ${item['currency']}', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.secondary)),
          onTap: () {
            context.pushNamed(RouteNames.editRecord, 
            extra: {'id': id, 'details': item},
            );
          },
          ),
        );
      },
    );
  }
}