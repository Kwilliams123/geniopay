import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/view/registration/widget/country_selection.dart';

import '../../../widget/text_input_field.dart';

class CountryTin extends StatelessWidget {
  final TextEditingController controller;
  final String countryName;
  final VoidCallback arrowDownTap;
  final VoidCallback deleteButtonTap;

  const CountryTin(
      {this.countryName = 'Brazil',
      required this.controller,
      required this.arrowDownTap,
      required this.deleteButtonTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final delete = Align(
      alignment: Alignment.topRight,
      child: SvgPicture.asset('svg/delete.svg'),
    );

    return Column(
      children: [
        CountrySelection(onTap: arrowDownTap),
        const SizedBox(
          height: 16,
        ),
        TextInputField(
          controller: controller,
        ),
        const SizedBox(height: 10,),
        InkWell(
          onTap: deleteButtonTap,
          child: delete,
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}
