import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/provider/home_provider.dart';
import 'package:geniopay/view/home/widget/promotion_card.dart';
import 'package:geniopay/view/home/widget/transaction_row.dart';

class HomeBottomSheet extends StatefulWidget {
  final HomeProvider vm;

  const HomeBottomSheet({required this.vm, Key? key}) : super(key: key);

  @override
  State<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewAllText = RichText(
      text: TextSpan(
          text: 'View All',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: textColor[250],
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async => await widget.vm.viewAll()),
    );

    final header = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Transactions',
            style: TextStyle(
              color: textColor[150],
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          viewAllText,
        ],
      ),
    );

    final controller = DraggableScrollableController();
    return DraggableScrollableSheet(
        builder: (BuildContext context, controller) {
      return Expanded(
        child: Container(
          //margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 4,
                  blurRadius: 4,
                  color: Colors.grey.withOpacity(0.09),
                )
              ]),
          child: Column(
            children: [
              SizedBox(
                width: 20,
                height: 10,
                child: Divider(
                  color: genioContainerColor[50],
                  thickness: 2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...widget.vm.promotion.map((e) => PromotionCard(
                          mainText: e.title,
                          description: e.description,
                          srcImage: e.srcImage,
                          color: promotionColor[e.id]!,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              header,
              const SizedBox(
                height: 20,
              ),
             Expanded(
               child: SingleChildScrollView(
                 child: SizedBox(
                   //height: size.height,
                   width: size.width,
                   child:
                 Column(
                  children: [
                    ...widget.vm.userData.purchase
                        .map((e) => TransactionRow(purchase: e))
                  ],
                ),),
              ),),
            ],
          ),
        ),
      );
    });
  }
}
