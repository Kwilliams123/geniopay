import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/view/insurance/widget/insurance_plan.dart';
import 'package:geniopay/view/insurance/widget/page_dot.dart';
import 'package:geniopay/view/insurance/widget/round_items.dart';

class Insurance extends StatefulWidget {
  const Insurance({Key? key}) : super(key: key);

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final headerIcons = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          InkWell(
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
          InkWell(
            child: Icon(
              Icons.help_outline_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
    );

    final promoText = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
      ),
      child: Center(
          child: Text(
        'The more money you send, the better your insurance gets',
        style: TextStyle(
          color: genioContainerColor[100],
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      )),
    );

    const textStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );

    final learnMoreText = RichText(text:
      TextSpan(
        children: [
          const TextSpan(
           text: 'Terms & Conditions apply, click ',// here for more'
           style: textStyle,
         ),
          TextSpan(
            text: 'here',
            style: TextStyle(
            color: genioContainerColor[100],
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () =>{}
          ),
          const TextSpan(
            text: ' for more',// here for more'
            style: textStyle,
          ),
        ]
      ),

    );
    final middleStack = InsurancePlan();
    final dots = Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        PageDot(),
        PageDot(size: 12,),
        PageDot(),
      ],),
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      color: genioContainerColor[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          headerIcons,
          const SizedBox(
            height: 20,
          ),
          promoText,
          const SizedBox(
            height: 40,
          ),
          middleStack,
           const SizedBox(height: 20,),
           dots,
           const SizedBox(height: 20,),
          learnMoreText,

        ],
      ),
    );
  }
}
