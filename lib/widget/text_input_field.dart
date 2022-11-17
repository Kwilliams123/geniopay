import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;

  const TextInputField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        border: Border.all(color: genioContainerColor[100]!),
      ),
      child: TextFormField(
        controller: controller,
        validator: (val) => val == null ||
            val.isEmpty ? 'This is a required field' :
            null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter TIN',
          labelStyle: TextStyle(
            color: textColor[350],
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
