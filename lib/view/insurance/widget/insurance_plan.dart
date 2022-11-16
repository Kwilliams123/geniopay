import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';

class InsurancePlan extends StatelessWidget {
  final String planName;
  final String spendUpTo;
  final String getUpTo;

  const InsurancePlan(
      {this.planName = 'Basic plan',
      this.spendUpTo = '200',
      this.getUpTo = '5,000',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final planText = Center(
      child: Text(
        planName,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),
      ),
    );

    final descriptionText = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: Center(
        child: Text(
          'Send €$spendUpTo (or more) per month and get coverage for:',
          style: TextStyle(
            color: genioContainerColor[100],
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          softWrap: true,
        ),
      ),
    );
    final divider = Column(children: const [
      SizedBox(
        height: 20,
      ),
      Divider(
        color: lineColor,
        thickness: 2,
      ),
      SizedBox(
        height: 20,
      ),
    ]);

    const na = Text(
      'N/A',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );

    final insuranceRow1 = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Accidental death, \ndismemberment or \nparalysis',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        const Spacer(),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'up to\n',
              style: TextStyle(
                color: textColor[300],
                fontWeight: FontWeight.w300,
                fontSize: 12,
              )),
          TextSpan(
              text: '€$getUpTo',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ))
        ]))
      ],
    );

    final insuranceRow2 = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            const TextSpan(
                text: 'Temporary total\ndisability\n',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            TextSpan(
                text: '(caused by accident)',
                style: TextStyle(
                  color: textColor[300],
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                )),
          ]),
        ),
        const Spacer(),
        na,
      ],
    );

    final insuranceMort = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            const TextSpan(
                text: 'Funeral cost\n\n',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
            TextSpan(
                text: 'OR\n\n',
                style: TextStyle(
                  color: textColor[300],
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                )),
            const TextSpan(
                text: 'Reparation',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ))
          ]),
        ),
        const Spacer(),
        RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: 'N/A\n\n\n\nN/A',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                )),
          ]),
        ),
      ],
    );
    final insuranceBottomParent = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'In case of death due to an accident:',
            style: TextStyle(
              color: genioContainerColor[100],
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        insuranceMort,
        const SizedBox(
          height: 20,
        ),
      ],
    );

    return Container(
      width: size.width,
      padding: const EdgeInsets.only(
        top: 40,
        right: 20,
        left: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: boxShadowColor,
            blurRadius: 5,
            spreadRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Column(
        children: [
          planText,
          const SizedBox(
            height: 20,
          ),
          descriptionText,
          const SizedBox(
            height: 30,
          ),
          insuranceRow1,
          divider,
          insuranceRow2,
          divider,
          insuranceBottomParent,
        ],
      ),
    );
  }
}
