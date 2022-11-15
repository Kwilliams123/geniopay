import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant/colors.dart';

class PromotionCard extends StatelessWidget {
  final String mainText;
  final String description;
  final String srcImage;
  final MaterialColor color;
  const PromotionCard({required this.mainText, required this.description ,
    required this.srcImage, this.color = Colors.blue, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textColumn = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Text(mainText,
      style: TextStyle(
        color: textColor[250],
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      textAlign: TextAlign.start,),
        const SizedBox(height: 10,),
        Flexible(child: Text(
          description,
          style: TextStyle(
            color: textColor[100],
            fontWeight: FontWeight.w300,
            fontSize: 10,
          ),
          softWrap: true,
        ),),
      ],
    );
    return Container(
      //width: 0.4*size.width,
      height: 93,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(20,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textColumn,
          const SizedBox(width: 15,),
          Image.asset('images/$srcImage.png',),
        ],
      ),
    );
  }
}
