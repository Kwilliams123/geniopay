import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/emulated_api_data/promotions.dart';
import 'package:geniopay/model/promotions.dart';
import 'package:geniopay/provider/home_provider.dart';
import 'package:geniopay/view/home/widget/promotion_card.dart';

class HomeBottomSheet extends StatefulWidget {
  final HomeProvider vm;
  const HomeBottomSheet({required this.vm, Key? key}) : super(key: key);

  @override
  State<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  @override
  Widget build(BuildContext context) {

    final viewAllText = RichText(text: TextSpan(
      text: 'View All',
      style: TextStyle(
        decoration: TextDecoration.underline,
        color: textColor[250],
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () async => await widget.vm.viewAll()
    ),);

    final header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Transactions',
        style: TextStyle(
          color: textColor[150],
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),),
        viewAllText,
      ],
    );



    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30)
        )
      ),
      child: Column(
        children: [

          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...widget.vm.promotion.map((e) => PromotionCard(
                    mainText: e.title,
                    description: e.description, svg: e.svg))
              ],
            ),
          ),
          const SizedBox(height: 20,),
          header,
        ],
      ),
    );
  }
}
