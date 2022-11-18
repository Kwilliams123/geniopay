import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/model/transaction.dart';
import 'package:geniopay/utils/Utils.dart';

import '../constant/colors.dart';

class DashboardCard extends StatelessWidget {
  // Exchange rate
  late Transaction transaction;
  late VoidCallback tapArrow;
  DashboardCard({required this.transaction, required this.tapArrow,  super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final exchangeParent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'You send from ${transaction.sendFrom}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 6,
          ),
        ),

         Text(
          '1 ${transaction.fromCode} = ${Utils.moneyFormattedText(transaction.exchangeRate.toString())} ${transaction.toCode}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 8,
          ),
        ),

      ],
    );

    final usd = SvgPicture.asset('svg/usd.svg');
    // todo -> get real country picker package
    final fromCountryPicker = Row(
      children: [
        usd,
        const SizedBox(width: 5,),
        const Text(
          'USD',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
         const SizedBox(width: 5,),
         InkWell(
          onTap: tapArrow ,
          child: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: arrowDownColor,
              size: 13,
          ),
        )
      ],

    );

    final fromParent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        fromCountryPicker,
        RichText(text: TextSpan(
          children: [
            const TextSpan(
              text: '\$',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: '${Utils.moneyFormattedText(transaction.receiver.amount.toString())}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            )
          ]
        ),),
      ],
    );

    final toText = Align(
      alignment: Alignment.centerLeft,
      child:Text(
        'They receive in ${transaction.sendTo}',
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 6,
        ),
        textAlign: TextAlign.start,
      ) ,
    );

    double amountReceived = transaction.receiver.amount * transaction.exchangeRate;
    final toParent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        fromCountryPicker,
        RichText(text: TextSpan(
          children: [
            TextSpan(
              text: '€',
              style:  TextStyle(
                color: genioContainerColor[100],
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: '${Utils.moneyFormattedText(amountReceived.toString())}',
              style:  TextStyle(
                color: genioContainerColor[100],
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ]
        ),),
      ],
    );

    final progress = SvgPicture.asset('svg/progress.svg');
    final progressParent = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
        progress,
        const SizedBox(width: 5,),
        const Expanded(child: Divider(
          color: lineColor,
        ),),
     ],
    );
    return Container(
      width: size.width,
      height: 170,
      alignment: AlignmentDirectional.centerEnd,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20,),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor,
            spreadRadius: 2,
            blurRadius: 2,
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        exchangeParent,
          const SizedBox(height: 5,),
          fromParent,
          const SizedBox(height: 5,),
          progressParent,
          const SizedBox(height: 5,),
          toText,
          const SizedBox(height: 5,),
          toParent,
        ]
      ),
    );
  }
}
