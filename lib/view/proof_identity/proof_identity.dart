import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/routes/routes.dart';
import 'package:geniopay/view/proof_identity/widget/description_row.dart';
import 'package:geniopay/widget/button.dart';

class ProofIdentity extends StatelessWidget {
  final VoidCallback tapLink, tapArrowBack;

  const ProofIdentity(
      {required this.tapLink, required this.tapArrowBack, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final identityText = RichText(
      text: const TextSpan(children: [
        TextSpan(
          text: 'We need to verify your ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(
          text: 'identity',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
      ]),
    );

    void goBack() => Navigator.of(context).pop();

    final header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.help_outline_rounded,
            color: Colors.black,
          ),
        )
      ],
    );

    final prepareDocumentText = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Center(
        child: Text(
          'Please prepare documents mentioned above!',
          style: TextStyle(
            fontSize: 18,
            color: genioContainerColor[100],
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
    void onContinue() =>
      Navigator.of(context).pushNamed(Routes.homeRoute);

    final continueButton = LargeButton('Continue', ()=> onContinue());

    final additionalInformationText = Text(
      'There may also be rare situations where we would require you to upload additional documents',
      style: TextStyle(
        color: genioContainerColor[100],
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );

    final verifications = [
      DescriptionRow(
          title: 'Valid Government Issued ID Document Scan',
          linkText: 'learn more',
          svg: 'issued_card',
          onLinkTap: () {}),
      DescriptionRow(
          title: 'Proof of Residence Document Scan',
          linkText: 'learn more',
          svg: 'residence',
          onLinkTap: () {}),
      DescriptionRow(
          title:
              'We will ask you to record a short video of yourself using the app',
          svg: 'video',
          onLinkTap: () {})
    ];

    final baseParent = Flexible(
      child: Container(
      height: size.height,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            ...verifications,
            const SizedBox(
              height: 50,
            ),
            prepareDocumentText,
            const SizedBox(
              height: 30,
            ),
            additionalInformationText,
            const SizedBox(
              height: 30,
            ),
            continueButton,
            const Spacer(),
          ],
        ),
      ),
    );

    return Scaffold(
        body: SafeArea(
        child: Container(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      color: genioContainerColor[50],
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: header),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: identityText,
          ),
          const SizedBox(
            height: 30,
          ),
          baseParent,

        ],
      ),),),
    );
  }
}
