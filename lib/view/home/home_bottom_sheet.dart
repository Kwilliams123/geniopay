import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/model/promotions.dart';
import 'package:geniopay/provider/home_provider.dart';

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
        ),)
      ],
    );



    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30)
        )
      ),
    );
  }
}
