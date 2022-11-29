import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/widget/button_forward.dart';

class ReferenceCard extends StatelessWidget {
  const ReferenceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final message = SvgPicture.asset('assets/svg/message.svg');
    final arrowForward = ButtonForward(() { });
    final size = MediaQuery.of(context).size;
    const text = Text(
      'School fees',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    );

    return Container(
      width: size.width,
      height: 88,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.only(
          left: 20, top: 10, bottom: 10, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 2,
            color: boxShadowColor,
          )
        ]
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(child: message,
          ),
          const Positioned(
            left: 60,
            child: text,
          ),
           Positioned(
            right: 10,
            child: arrowForward,
          )
        ],
      ),
    );
  }
}
