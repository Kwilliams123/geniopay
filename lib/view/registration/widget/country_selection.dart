import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/constant/colors.dart';

class CountrySelection extends StatelessWidget {
  final String countryName;
  final VoidCallback onTap;

  const CountrySelection(
      {this.countryName = 'Brazil', required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final downArrow = IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: genioContainerColor[100],
      ),
    );

    final countryIcon = SvgPicture.asset(
        'svg/${countryName.toLowerCase() == 'brazil' ? 'brazil' : 'usa'}.svg');

    final countryText = RichText(
      text : TextSpan(
      children: [
        TextSpan(
          text: 'Country\n',
          style: TextStyle(
            color: textColor[350],
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
        ),
        TextSpan(
          text: countryName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        )
      ],
    ),);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
      decoration: BoxDecoration(
        color: genioContainerColor[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: genioContainerColor[100]!,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           countryIcon,
          const SizedBox(width: 5,),
          downArrow,
          const SizedBox(width: 5,),
          countryText,
        ],
      ),
    );
  }
}
