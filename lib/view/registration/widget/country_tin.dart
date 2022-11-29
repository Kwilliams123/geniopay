import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/view/registration/widget/country_selection.dart';

import '../../../widget/text_input_field.dart';

class CountryTin extends StatelessWidget {
  final TextEditingController controller;
  final String countryName;
  final  VoidCallback arrowDownTap;
  final VoidCallback deleteButtonTap;
  final int index;

  const CountryTin(
      {this.countryName = 'Brazil',
      required this.controller,
      required this.arrowDownTap,
      required this.deleteButtonTap,
        required this.index,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final delete = Align(
      alignment: Alignment.centerRight,
      child: SvgPicture.asset('assets/svg/delete.svg'),
    );

    return Column(
      children: [
        CountrySelection(countryName: countryName, onTap: arrowDownTap),
        const SizedBox(
          height: 16,
        ),
        TextInputField(
          controller: controller,
        ),
        const SizedBox(height: 10,),
        InkWell(
          onTap: deleteButtonTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 3),
           child: delete,
        ),),
        const SizedBox(height: 20,),
      ],
    );
  }
}
