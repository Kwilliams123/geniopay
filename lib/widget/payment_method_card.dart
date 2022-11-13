import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/widget/button_forward.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final creditCard = SvgPicture.asset('svg/credit-card.svg');

    final masterCard = SvgPicture.asset('svg/master-card.svg');
    final arrowForward = ButtonForward(() {});

    const textParent =
    Text(
      'Card Payment',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
    );


    final masterCardParent = Row(
      children: [
        masterCard,
        const SizedBox(width: 5,),
        const Text(
          'Mastercard x-123',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );

    return Container(
        width: size.width,
        height: 88,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.only(
            left: 20, top: 10, bottom: 10, right: 30),
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
            Positioned(child: creditCard),
            Positioned(left: 60,
              child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
              children: [
                textParent,
                masterCardParent,
              ],
            ),),
            Positioned(right: 10, child: arrowForward, ),
          ],
        )
    );
  }
}