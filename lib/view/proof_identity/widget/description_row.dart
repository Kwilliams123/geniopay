import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geniopay/constant/colors.dart';

class DescriptionRow extends StatelessWidget {
  final String title;
  final String linkText;
  final String svg;
  final VoidCallback onLinkTap;

  const DescriptionRow(
      {required this.title,
      required this.svg,
      this.linkText = '',
      required this.onLinkTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final description = Flexible(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: '$title\n',
              style: TextStyle(
                color: textColor[100],
                fontWeight: FontWeight.w400,
                fontSize: 16,
              )),
          TextSpan(
              text: linkText,
              style: TextStyle(
                color: genioContainerColor[100],
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              )),
        ]),
        softWrap: true,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SvgPicture.asset('svg/$svg.svg'),
        const SizedBox(
          width: 20,
        ),
        description,
        const SizedBox(
          width: 20,
        ),
      ]),
    );
  }
}
