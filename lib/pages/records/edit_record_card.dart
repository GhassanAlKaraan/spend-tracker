import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/color_manager.dart';
import 'package:spend_tracker/resources/values_manager.dart';

class EditRecordCard extends StatefulWidget {
  final Map<String, dynamic> record;
  final Function(Map<String, dynamic>) onSave;

  EditRecordCard({super.key, required this.record, required this.onSave});

  @override
  State<EditRecordCard> createState() => _EditRecordCardState();
}

class _EditRecordCardState extends State<EditRecordCard> {
  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _subTypeController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _currencyController = TextEditingController();

  final TextEditingController _dateCreatedController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with the current record values
    _subTypeController.text = widget.record['subType'];
    _descriptionController.text = widget.record['description'];
    _amountController.text = widget.record['amount'].toString();
    _currencyController.text = widget.record['currency'];
    _dateCreatedController.text = widget.record['dateCreated'];
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed with updating the record
      Map<String, dynamic> updatedRecord = {
        'id': widget.record['id'],
        'type': widget.record['type'],
        'subType': _subTypeController.text,
        'description': _descriptionController.text,
        'amount': int.tryParse(_amountController.text) ?? widget.record['amount'],
        'currency': _currencyController.text,
        'dateCreated': _dateCreatedController.text,
      };

      widget.onSave(updatedRecord);
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
                Text(
                  'Edit Record', // This is a placeholder, update as needed
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSize.s20),
                // Displaying non-editable fields as Text
                Text('ID: ${widget.record['id']}'),
                Text('Type: ${widget.record['type']}'),
                const SizedBox(height: AppSize.s20),
                // Editable fields start here
                TextFormField(
                  controller: _subTypeController,
                  decoration: const InputDecoration(labelText: 'Sub Type'),
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _currencyController,
                  decoration: const InputDecoration(labelText: 'Currency'),
                ),
                TextFormField(
                  controller: _dateCreatedController,
                  decoration: const InputDecoration(labelText: 'Date Created'),
                ),
                const SizedBox(height: AppSize.s40),
                ElevatedButton(
                  onPressed: _save,
                  child: const Text('Save Changes'),
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
