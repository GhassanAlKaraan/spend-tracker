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
  bool isLoading = true; // Start with loading true

  @override
  void initState() {
    super.initState();
    populateProviderList();
  }

  void populateProviderList() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate waiting time
    Provider.of<RecordProvider>(context, listen: false).populateList();
    setState(() {
      isLoading = false; // Data loaded, update loading state
    });
  }

  @override
  Widget build(BuildContext context) {
    // Using Consumer to listen to RecordProvider changes
    return Consumer<RecordProvider>(
      builder: (context, recordProvider, child) {
        if (isLoading) {
          return Center(child: CircularProgressIndicator());
        }

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
                  item.id.toString(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                title: Text(
                  item.type,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  '${item.subType} - ${item.description}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: Text(
                  '${item.amount.toString()} ${item.currency}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorManager.secondary),
                ),
                onTap: () {
                  context.pushNamed(
                    RouteNames.editRecord,
                    extra: {'id': item.id, 'details': item},
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
