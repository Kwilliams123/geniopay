import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/widget/button_forward.dart';

class DeliveryTimeCard extends StatelessWidget {
  const DeliveryTimeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final send = SvgPicture.asset('assets/svg/send.svg');

    final lightening = SvgPicture.asset('assets/svg/lightening.svg');
    final arrowForward = ButtonForward(() {});

    const textParent =
    Text(
      'Within 30 minutes',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    );

    const crossText =  Text(
      '\$ 3.00',
      style: TextStyle(
        decoration: TextDecoration.lineThrough,
        color: Colors.black,
      ),
    );

    final freeText = Text(
      'Free',
      style: TextStyle(
        color: genioContainerColor[100],
      ),
    );

    final instantParent = Row(
      children: [
        lightening,
        const SizedBox(width: 5,),
        const Text(
          'Instant',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 12
          ),
        )
      ],
    );

    final instantMainTextParent = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        instantParent,
        const SizedBox(height: 5,),
        textParent,
      ],
    );
    final freeAmountParent = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        freeText,
        const SizedBox(height: 5,),
        crossText,
      ],
    );

    return Container(
        width: size.width,
        height: 88,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.only(
            left: 20, top: 10, bottom: 10, right: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 2,
                color: boxShadowColor
                ,)
            ]
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(child: send),
            Positioned(left: 60,
              child: instantMainTextParent,),
            Positioned(right: 70, child: freeAmountParent,),
            Positioned(right: 10, child: arrowForward, ),
          ],
        )
    );
  }
}