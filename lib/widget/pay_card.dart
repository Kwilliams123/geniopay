import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/utils/Utils.dart';

class PayCard extends StatelessWidget {
  final String title;
  final String amount;
  const PayCard({required this.title, required this.amount, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final payImage =  SvgPicture.asset('svg/pay.svg', semanticsLabel: 'Pay' );

    final textParent = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 5,),
        Text('\$ ${ Utils.moneyFormattedText(amount)}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),)
      ],
    );
    return Container(
      width: size.width,
      height: 65,
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: genioContainerColor[100]
      ),
      child: Row(
       // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         payImage,
         const SizedBox(width: 15,),
          textParent,
        ],
      ),
    );
  }
}
