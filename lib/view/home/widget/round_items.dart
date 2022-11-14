import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geniopay/constant/colors.dart';

class RoundItems extends StatelessWidget {
  final String svg;
  final String text;
  final VoidCallback tapIcon;
  const RoundItems({required this.text, required this.svg,
    required this.tapIcon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = InkWell(
      onTap: tapIcon,
      child: SvgPicture.asset('svg/$svg.svg'),
    );
    return Column(
      children: [
        icon,
        const SizedBox(height: 5,),
        Text(text,
        style: TextStyle(
          color: genioContainerColor[100],
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),)
      ],
    );
  }
}
