import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';

class RoundName extends StatelessWidget {
  final String text;
  const RoundName({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: genioContainerColor[50],
        shape: BoxShape.circle,
      ),
      child:Center(
      child: Text(
          text.substring(0,1).toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 19,
        ),
      ),
      ),
    );
  }
}
