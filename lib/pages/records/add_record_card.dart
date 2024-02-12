import 'package:flutter/material.dart';
import 'package:spend_tracker/models/record_model.dart';
import 'package:spend_tracker/resources/color_manager.dart';
import 'package:spend_tracker/resources/values_manager.dart';

class AddRecordCard extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;

  AddRecordCard({super.key, required this.onSave});

  @override
  State<AddRecordCard> createState() => _AddRecordCardState();
}

class _AddRecordCardState extends State<AddRecordCard> {
  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _subTypeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();
  final TextEditingController _dateCreatedController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // dispose all text fields
    _subTypeController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    _currencyController.dispose();
    _dateCreatedController.dispose();
  }

  void _save() async {
    if (_formKey.currentState!.validate()) { //TODO: implement form validation logic
      // TODO: create object and save in provider
      // If the form is valid, proceed with updating the record
      // RecordModel(type: type, subType: subType, description: description, amount: amount, currency: currency)
      // widget.onSave(newRecord);
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
                  '-TYPE DropDown-',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: AppSize.s20),
                // Editable fields start here
                TextFormField(
                  controller: _subTypeController,
                  decoration: const InputDecoration(labelText: 'Sub Type'),
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
                const SizedBox(height: AppSize.s40),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: _save,
                      child: const Text('Create Record'),
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
