import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/extended_function/extensions.dart';
import 'package:geniopay/provider/registration_tax_provider.dart';
import 'package:geniopay/utils/Utils.dart';
import 'package:geniopay/view/registration/widget/add_country.dart';
import 'package:geniopay/view/registration/widget/country_tin.dart';
import 'package:geniopay/widget/button.dart';
import 'package:provider/provider.dart';

class RegistrationTax extends StatefulWidget {
  RegistrationTax({super.key});

  late List<CountryTin> countryTin;

  @override
  State<RegistrationTax> createState() => _RegistrationTaxState();
}

class _RegistrationTaxState extends State<RegistrationTax> {
  late RegistrationTaxProvider vm;

  @override
  void initState() {
    // TODO: implement initState
    vm = context.read<RegistrationTaxProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    vm = context.watch<RegistrationTaxProvider>();
    final size = MediaQuery.of(context).size;
    final TextEditingController controller = TextEditingController();
    onArrowDown() {}

    // todo -> use form global keys to track the controllers and form states
    int index = 0;
    onDelete() {}
    widget.countryTin = [
      CountryTin(
        controller: controller,
        arrowDownTap: onArrowDown,
        deleteButtonTap: onDelete,
      ),
    ];

    onAddCountry() {
      // todo -> create just in time controllers for

      // update the UI
      setState(() {
        widget.countryTin.add(
          CountryTin(
            countryName: 'USA',
            controller: controller,
            arrowDownTap: onArrowDown,
            deleteButtonTap: onDelete,
          ),
        );
      });

      print('Add Country was done');
    }

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

    final noticeParent2 = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '2. FATCA related',
            style: boldStyle,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Please select one of the options by checking'
          'the corresponding box below',
          style: boldBlackStyle2,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );

    final boldStyle2 = TextStyle(
      color: genioContainerColor[100],
      fontWeight: FontWeight.w300,
      fontSize: 16,
    );

    final declarationParent1 = Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        children: [
          Flexible(
            child: RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: 'I hereby certify that ',
                  style: boldBlackStyle2,
                ),
                TextSpan(
                  text: 'I am a tax resident of the United States',
                  style: boldStyle2,
                ),
                const TextSpan(
                  text: ' and that I have designated the United States as one '
                      'of the countries in the above section.',
                  style: boldBlackStyle2,
                ),
              ]),
              softWrap: true,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Checkbox(
              // checkColor: genioContainerColor[100],
              value: vm.declaration1,
              onChanged: (bool? val) {
                setState(() {
                  vm.declaration1 = !vm.declaration1;
                  vm.declaration2 = !vm.declaration1;
                });
              })
        ],
      ),
    );

    final addButton = AddCountry(onAddTap: onAddCountry);

    final divider = Column(
      children: [
        Divider(
          color: genioContainerColor[50],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );

    final declarationParent2 = Row(
      children: [
        Flexible(
          child: RichText(
            text: TextSpan(children: [
              const TextSpan(
                text: 'I hereby certify that ',
                style: boldBlackStyle2,
              ),
              TextSpan(
                text: 'I am not a tax resident of the United States.',
                style: boldStyle2,
              ),
            ]),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Checkbox(
            //checkColor: genioContainerColor[100],
            value: vm.declaration2,
            onChanged: (bool? val) {
              setState(() {
                vm.declaration2 = !vm.declaration2;
                vm.declaration1 = !vm.declaration2;
              });
            })
      ],
    );

    final declarationParent3 = Row(
      children: [
        Flexible(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(text: '3. Declaration\n\n', style: boldStyle),
            const TextSpan(
              text: 'I herby declare that the information '
                  'provided on this form is complete, correct and true. '
                  'The information provided may be used for reporting purposes according'
                  ' to local law. I agree that I will inform you within 30 days if any'
                  ' certification on this form becomes incorrect '
                  'or will no longer be applied.',
              style: boldBlackStyle2,
            ),
          ])),
        ),
        Checkbox(
            //checkColor: genioContainerColor[100],
            value: vm.declaration3,
            onChanged: (bool? val) {
              setState(() {
                vm.declaration3 = !vm.declaration3;
              });
            })
      ],
    );

    final continueButton =
        LargeButton('Continue', color: genioContainerColor[50]!, vm.onContinue);
    final bottomParent = Column(
      children: [
        Center(
            child: Text(
          'Date: ${Utils.dateNow()}',
          style: boldStyle,
        )),
        const SizedBox(
          height: 16,
        ),
        continueButton,
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      color: Colors.white,
      child: Column(children: [
        header,
        Flexible(
     child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              description,
              noticeParent1,
              const SizedBox(
                height: 24,
              ),
              ...widget.countryTin,
              addButton,
              noticeParent2,
              declarationParent1,
              divider,
              declarationParent2,
              const SizedBox(
                height: 20,
              ),
              divider,
              declarationParent3,
              const SizedBox(
                height: 20,
              ),
              divider,
              bottomParent,
            ],
          ),
        ),),
      ]),
    );
  }
}
