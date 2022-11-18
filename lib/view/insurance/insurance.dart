import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/view/insurance/widget/insurance_plan.dart';
import 'package:geniopay/view/insurance/widget/page_dot.dart';
import 'package:geniopay/view/insurance/widget/round_items.dart';

class Insurance extends StatefulWidget {
  final String name;
  final String spendUpTo;
  final String getUpTo;
  final int index;

  const Insurance({
    this.name = 'Basic plan',
    this.spendUpTo = '200',
    this.getUpTo = '5,000',
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void goBack() => Navigator.of(context).pop();

    final headerIcons = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => goBack(),
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          const InkWell(
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

    final learnMoreText = RichText(
      text: TextSpan(children: [
        const TextSpan(
          text: 'Terms & Conditions apply, click ', // here for more'
          style: textStyle,
        ),
        TextSpan(
            text: 'here',
            style: TextStyle(
              color: genioContainerColor[100],
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () => {}),
        const TextSpan(
          text: ' for more', // here for more'
          style: textStyle,
        ),
      ]),
    );
    final dots = Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageDot(
            size: widget.index == 0 ? 12 : 8,
          ),
          PageDot(
            size: widget.index == 1 ? 12 : 8,
          ),
          PageDot(size: widget.index == 2 ? 12 : 8),
        ],
      ),
    );

    final insurancePageCard = Flexible(
      child: Column(
        children: [
          headerIcons,
          const SizedBox(
            height: 20,
          ),
          promoText,
          const SizedBox(
            height: 50,
          ),
          InsurancePlan(
            planName: widget.name,
            spendUpTo: widget.spendUpTo,
            getUpTo: widget.getUpTo,
          ),
          const Spacer(),
          Column(
              children: [
                dots,
                const SizedBox(
                  height: 20,
                ),
                learnMoreText,
              ],
            ),
        ],
      ),
    );
    final planIcon = Positioned(
      top: size.height * 0.13,
      child: RoundItems(planName: widget.name),
    );

    return Container(
          width: size.width,
          height: size.height,
          color: genioContainerColor[50],
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [insurancePageCard, planIcon],
          ),
    );
  }
}
