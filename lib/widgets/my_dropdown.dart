import 'package:flutter/material.dart';
import 'package:spend_tracker/resources/color_manager.dart';
import 'package:spend_tracker/resources/styles_manager.dart';
import 'package:spend_tracker/resources/values_manager.dart';

// ignore: must_be_immutable
class MyDropDown extends StatefulWidget {
  MyDropDown({super.key, required this.onChoose, required this.listOfValues, required this.hintText, this.initialValue});

  final void Function(String) onChoose; // callback
  final List<String> listOfValues;
  final String hintText;
  String? initialValue;
  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {

  _onSelect(value) {
    widget.onChoose(value);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          filled: true,
          contentPadding: const EdgeInsets.only(right: 10, left: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(
              Radius.circular(RadiusConstant.r14),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(
              Radius.circular(RadiusConstant.r14),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(
              Radius.circular(RadiusConstant.r14),
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: AppSize.s1_5, color: Colors.red),
              borderRadius: BorderRadius.circular(RadiusConstant.r14)),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RadiusConstant.r8),
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          ),
        ),
        elevation: 1,
        validator: (value) {
          if (value == null || value.toString().isEmpty) {
            return 'Please choose value';
          } else {
            return null;
          }
        },
        isExpanded: true,
        hint: Text(
          widget.hintText,
          style: getRegularStyle(color: ColorManager.grey1),
        ),
        iconSize: AppSize.s30,
        iconEnabledColor: ColorManager.primary,
        icon: const Icon(
          Icons.arrow_drop_down_sharp,
          size: AppSize.s14,
        ),
        value: widget.initialValue,
        items: widget.listOfValues.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: getRegularStyle(color: ColorManager.grey1)
                  .copyWith(fontSize: AppSize.s16),
            ),
          );
        }).toList(),
        onChanged: _onSelect);
  }
}
