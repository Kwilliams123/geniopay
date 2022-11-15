import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant/colors.dart';

class PromotionCard extends StatelessWidget {
  final String mainText;
  final String description;
  final String svg;
  final Color color;
  const PromotionCard({required this.mainText, required this.description ,
    required this.svg, this.color = const Color(0xffe0f7fe), Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textColumn = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Text(mainText,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),),
        const SizedBox(height: 10,),
        Flexible(child: Text(
          description,
          style: TextStyle(
            color: textColor[100],
            fontWeight: FontWeight.w300,
            fontSize: 10,
          ),
        ),),
      ],
    );
    return Container(
      width: 0.7*size.width,
      height: 93,
      padding: const EdgeInsets.all(20,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Row(
        children: [
          textColumn,
          const SizedBox(width: 15,),
          SvgPicture.asset('svg/$svg.svg',),
        ],
      ),
    );
  }
}
