import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/widget/button.dart';

class ProofIdentity extends StatelessWidget {
  final VoidCallback tapLink, tapArrowBack;

  const ProofIdentity(
      {required this.tapLink, required this.tapArrowBack, super.key});

  @override
  Widget build(BuildContext context) {
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

    descriptionRow(String svg, String message, String linkMessage) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('svg/$svg.svg'),
          const SizedBox(
            width: 20,
          ),
          Column(children: [
            Flexible(
              child: Text(
                message,
                style: TextStyle(
                  color: textColor[100],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            linkMessage.isEmpty
                ? Container()
                : RichText(
                    text: TextSpan(
                        text: linkMessage,
                        style: TextStyle(
                          color: genioContainerColor[100],
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => tapLink),
                  ),
          ]),
        ],
      );
    }

    final prepareDocumentText = Center(
      child: Text(
        'Please prepare documents mentioned above!',
        style: TextStyle(
          fontSize: 18,
          color: genioContainerColor[100],
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    final continueButton = LargeButton('Continue', () {});

    final additionalInformationText = Text(
      'There may also be rare'
      ' situations where we would'
      ' require you to upload additional documents',
      style: TextStyle(
        color: genioContainerColor[100],
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );

    final baseParent = Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            descriptionRow('issued_card',
                'Valid Government Issued ID Document Scan', 'learn more'),
            const SizedBox(
              height: 30,
            ),
            descriptionRow(
                'residence', 'Proof of Residence Document Scan', 'learn more'),
            const SizedBox(
              height: 30,
            ),
            descriptionRow(
                'video',
                'We will ask you to record a short video of yourself using the app',
                ''),
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
          ],
        ),
      ),
    );

    return Container(
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
          const SizedBox(
            height: 30,
          ),
          continueButton,
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
