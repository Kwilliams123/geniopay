import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/extended_function/extensions.dart';

class RoundName extends StatelessWidget {
  final String text;
  const RoundName({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: genioContainerColor[50],
        shape: BoxShape.circle,
      ),
      child:Center(
      child: Text(
          text.firstLetter,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      ),
    );
  }
}
