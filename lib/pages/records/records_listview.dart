import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spend_tracker/providers/record_provider.dart';
import 'package:spend_tracker/resources/app_router.dart';
import 'package:spend_tracker/resources/color_manager.dart';
import 'package:spend_tracker/resources/values_manager.dart';

class RecordsListView extends StatefulWidget {
  RecordsListView({super.key});

  @override
  State<RecordsListView> createState() => _RecordsListViewState();
}

class _RecordsListViewState extends State<RecordsListView> {
  // bool isLoading = true; // Start with loading true

  // void populateProviderList() {
  //   Provider.of<RecordProvider>(context, listen: false).populateList(false);
  //   setState(() {
  //     isLoading = false; // Data loaded, update loading state
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   populateProviderList();
  // }

  @override
  Widget build(BuildContext context) {
    // Using Consumer to listen to RecordProvider changes
    return Consumer<RecordProvider>(
      builder: (context, recordProvider, child) {
        return ListView.builder(
          itemCount: recordProvider.recordsList.length,
          itemBuilder: (context, index) {
            final item = recordProvider.recordsList[index];
            return Padding(
              padding: const EdgeInsets.all(AppPadding.p4),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: ColorManager.primary,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(
                      4), // Optional: if you want rounded corners
                ),
                leading: Text(
                  item.type,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${item.subType} - ${item.description}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${item.amount.toString()} ${item.currency}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorManager.secondary),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () {
                    // Provider.of<RecordProvider>(context, listen: false).removeRecord(item.id);
                    context.read<RecordProvider>().removeRecord(item.id);
                  },
                ),
                onTap: () {
                  context.pushNamed(
                    RouteNames.editRecord,
                    extra: item,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
