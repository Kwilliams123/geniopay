import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/view/registration/widget/country_tin.dart';

class RegistrationTax extends StatefulWidget {
  const RegistrationTax({super.key});

  @override
  State<RegistrationTax> createState() => _RegistrationTaxState();
}

class _RegistrationTaxState extends State<RegistrationTax> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final List<CountryTin> countryTin = [CountryTin(controller: controller, arrowDownTap: (){}, deleteButtonTap: (){})];
    
    final header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        const Text(
          'Registration',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.help_outline_rounded,
            color: Colors.black,
          ),
        ),
      ],
    );
    final boldStyle = TextStyle(
      color: genioContainerColor[100],
      fontWeight: FontWeight.w600,
      fontSize: 16,
    );

    const boldBlackStyle1 = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );

    final normalStyle = TextStyle(
      color: textColor[250],
      fontWeight: FontWeight.w300,
      fontSize: 14,
    );

    const boldBlackStyle2 = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );

    final description = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Center(
        child: RichText(
          text: TextSpan(children: [
            const TextSpan(
              text: 'Individual Self-Certification relevant for ',
              style: boldBlackStyle1,
            ),
            TextSpan(
              text: 'FATCA',
              style: boldStyle,
            ),
            const TextSpan(
              text: ' and ',
              style: boldBlackStyle1,
            ),
            TextSpan(
              text: 'CRS',
              style: boldStyle,
            ),
            const TextSpan(
              text: ' purposes',
              style: boldBlackStyle1,
            ),
          ]),
          textAlign: TextAlign.center,
        ),
      ),
    );

    final notice1 = Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '1. Country of your Tax Residence',
        style: boldStyle,
        textAlign: TextAlign.start,
      ),
    );
    const noticeDescription1 = Text(
      'Please indicate all countries, also domestic, '
      'where you are tax resident and your TIN (Taxpay '
      'Identification Number) for each country:',
      style: boldBlackStyle2,
    );

    final noticeParent1 = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        notice1,
        const SizedBox(
          height: 10,
        ),
        noticeDescription1
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            header,
            const SizedBox(
              height: 24,
            ),
            description,
            noticeParent1,
            const SizedBox(height: 24,),
            ...countryTin,
          ],
        ),
      ),
    );
  }
}
