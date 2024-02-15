import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spend_tracker/providers/record_provider.dart';
import 'package:spend_tracker/resources/app_router.dart';
import 'package:spend_tracker/resources/color_manager.dart';
import 'package:spend_tracker/resources/values_manager.dart';
import 'package:spend_tracker/app/utils.dart' as utils;

class RecordsListView extends StatefulWidget {
  RecordsListView({super.key});

  @override
  State<RecordsListView> createState() => _RecordsListViewState();
}



class _RecordsListViewState extends State<RecordsListView> {

@override
  void initState() {
    super.initState();
    Provider.of<RecordProvider>(context, listen: false).fetchRecords();
  }
  
  @override
  Widget build(BuildContext context) {
    // Using Consumer to listen to RecordProvider changes
    return Consumer<RecordProvider>(
      builder: (context, recordProvider, child) {
        return recordProvider.recordsList.isEmpty
            ? Center(
                child: Text(
                  "No Records",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            : ListView.builder(
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
                        borderRadius: BorderRadius.circular(4),
                      ),
                      leading: Text(
                        item.type ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              '${item.reason ?? ''} - ${item.description ?? ''}',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${item.amount.toString()} ${item.currency ?? ''}',
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

                          //TODO: refactor
                          utils.showAlertDialog(context, () {
                            try {
                              Provider.of<RecordProvider>(context,
                                      listen: false)
                                  .removeRecord(item.sId!);
                              utils.showSnackBar(context, 'Record removed');
                            } catch (e) {
                              utils.showSnackBar(
                                  context, 'Something wrong happened');
                            }
                          }, 'Delete record from DB');
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
