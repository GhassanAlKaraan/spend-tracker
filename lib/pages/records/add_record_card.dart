import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:spend_tracker/resources/color_manager.dart';
import 'package:spend_tracker/resources/styles_manager.dart';
import 'package:spend_tracker/resources/values_manager.dart';
import '../../app/utils.dart' as utils;

class AddRecordCard extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave; // callback

  AddRecordCard({super.key, required this.onSave});

  @override
  State<AddRecordCard> createState() => _AddRecordCardState();
}

class _AddRecordCardState extends State<AddRecordCard> {
  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Values
  var chosenTypeValue;
  List<String> typeList = ["family", "food", "health", "transport", "other"];

  // Controllers
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController =
      TextEditingController(); //TODO: must be a dropdown menu
  final TextEditingController _currencyController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _reasonController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    _currencyController.dispose();
  }

  void _createRecord() async {
    if (_formKey.currentState!.validate()) {
      // TODO: add loading
      Map<String, dynamic> newDetails = {
        'type': chosenTypeValue,
        'reason': _reasonController.text.trim(),
        'description': _descriptionController.text.trim(),
        'amount': int.tryParse(_amountController.text.trim()) ?? 0,
        'currency': _currencyController.text.trim()
      };
      widget.onSave(newDetails);
      utils.showSnackBar(context, 'Record created.');
      context.pop();
    }
  }

  String? _validateReason(String? reason) {
    if (reason == null || reason.isEmpty) {
      return "Please specify reason";
    }
    return null;
  }

  String? _validateAmount(String? amount) {
    if (amount == null || amount.isEmpty) {
      return "Please specify amount";
    }
    return null;
  }

  String? _validateCurrency(String? currency) {
    if (currency == null || currency.isEmpty) {
      return "Please specify currency";
    }
    if (!currency.isEmpty && currency != 'LBP' && currency != 'USD') {
      return "Invalid currency, use: LBP or USD";
    }
    return null;
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
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.only(right: 10, left: 10),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black, width: AppSize.s1_5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(RadiusConstant.r14),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorManager.primary, width: AppSize.s1_5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(RadiusConstant.r14),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorManager.grey, width: AppSize.s1_5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(RadiusConstant.r14),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: AppSize.s1_5, color: Colors.red),
                          borderRadius:
                              BorderRadius.circular(RadiusConstant.r14)),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(RadiusConstant.r8),
                        borderSide: BorderSide(
                            color: ColorManager.primary, width: AppSize.s1_5),
                      ),
                    ),
                    elevation: 1,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Please specify Type';
                      } else {
                        return null;
                      }
                    },
                    isExpanded: true,
                    hint: Text(
                      "Type",
                      style: getRegularStyle(color: ColorManager.grey1),
                    ),
                    iconSize: 30,
                    iconEnabledColor: ColorManager.primary,
                    icon: const Icon(
                      Icons.arrow_drop_down_sharp,
                      size: AppSize.s14,
                    ),
                    value: chosenTypeValue,
                    items:
                        typeList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: getRegularStyle(color: ColorManager.grey1)
                              .copyWith(fontSize: AppSize.s16),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        chosenTypeValue = value;
                      });
                    }),
                const SizedBox(height: AppSize.s10),
                TextFormField(
                  maxLength: 20,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: _reasonController,
                  validator: _validateReason,
                  decoration: const InputDecoration(
                    labelText: 'Reason',
                    counterText: "",
                  ),
                ),
                const SizedBox(height: AppSize.s10),
                TextFormField(
                  maxLength: 50,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  maxLines: 3,
                  minLines: 3,
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    counterText: "",
                  ),
                ),
                const SizedBox(height: AppSize.s10),
                TextFormField(
                  maxLength: 9,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: _amountController,
                  validator: _validateAmount,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    counterText: "",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: AppSize.s10),
                TextFormField(
                  maxLength: 3,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: _currencyController,
                  validator: _validateCurrency,
                  decoration: const InputDecoration(
                    labelText: 'Currency',
                    counterText: "",
                  ),
                ),
                const SizedBox(height: AppSize.s40),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: _createRecord,
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
