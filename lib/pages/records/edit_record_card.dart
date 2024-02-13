import 'package:flutter/material.dart';
import 'package:spend_tracker/models/record_model.dart';
import 'package:spend_tracker/resources/color_manager.dart';
import 'package:spend_tracker/resources/values_manager.dart';

class EditRecordCard extends StatefulWidget {
  final RecordModel record;
  final Function(RecordModel) onSave; // callback

  EditRecordCard({super.key, required this.record, required this.onSave});

  @override
  State<EditRecordCard> createState() => _EditRecordCardState();
}

class _EditRecordCardState extends State<EditRecordCard> {
  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _reasonController.text = widget.record.reason ?? "";
    _descriptionController.text = widget.record.description ?? "";
    _amountController.text = widget.record.amount.toString();
    _currencyController.text = widget.record.currency  ?? "";
  }
  @override
  void dispose() {
    super.dispose();
    _reasonController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    _currencyController.dispose();
  }

  void _save() async {
    // TODO: validate fields are not empty
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed with updating the record
      RecordModel newRecordModel = RecordModel(
        sId: '1234567890', //TODO :: ID MUST NOT BE PART OF MODEL, backend must handle the data manipulation
        amount: int.tryParse(_amountController.text)?? 0,
        currency: _currencyController.text, //TODO: must be dropdown
        description: _descriptionController.text,
        lastUpdated: DateTime.now().toString(), //TODO ????
        reason: _reasonController.text,
        type: widget.record.type,
      );

      widget.onSave(newRecordModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s14)),
        elevation: 1,
        color: ColorManager.background,
        margin: const EdgeInsets.all(AppMargin.m8),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppSize.s20),
                // Displaying non-editable fields as Text
                Text(
                  'Type: ${widget.record.type}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSize.s20),
                // Editable fields start here
                TextFormField(
                  controller: _reasonController,
                  decoration: const InputDecoration(labelText: 'Reason'),
                ),
                const SizedBox(height: AppSize.s10),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(height: AppSize.s10),
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: AppSize.s10),
                TextFormField(
                  controller: _currencyController,
                  decoration: const InputDecoration(labelText: 'Currency'),
                ),
                const SizedBox(height: AppSize.s10),
                Text(
                  // 'Last Updated: ${DateFormat('dd-MM-yyyy @ HH:mm a').format(DateTime.parse(widget.record.lastUpdated))}',
                  'Last Updated: ${widget.record.lastUpdated}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: AppSize.s40),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: _save,
                      child: const Text('Save Changes'),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
