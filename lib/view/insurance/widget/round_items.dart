import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/extended_function/extensions.dart';

class RoundItems extends StatelessWidget {
  final String planName;

  const RoundItems({required this.planName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: insuranceGradientColors,
    );
    final innerGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: insuranceInnerGradientColors,
    );
    final text = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        gradient: gradient,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          planName.firstLetter,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 45,
          ),
        ),
      ),
    );

    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xff008aa7).withOpacity(0.07),
        shape: BoxShape.circle,
      ),
      child: text,
    );
  }
}
