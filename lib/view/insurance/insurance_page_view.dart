import 'package:flutter/material.dart';

import 'insurance.dart';

class InsurancePageView extends StatefulWidget {
  const InsurancePageView({Key? key}) : super(key: key);

  @override
  State<InsurancePageView> createState() => _InsurancePageViewState();
}

class _InsurancePageViewState extends State<InsurancePageView> {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 0
    );

    int index = controller.initialPage;

    final pages = PageView(
      controller: controller,
      children: const [
        Insurance(index: 0,
          name: 'Gold plan',
          getUpTo: '12,000',
          spendUpTo: '400',
        ),
        Insurance(index: 1,
         name: 'Basic plan',
          getUpTo: '5,000',
          spendUpTo: '200',
        ),
        Insurance(index: 2,
          name: 'Premium',
          getUpTo: '20,000',
          spendUpTo: '600',
        )
      ],
    );

    return Scaffold(
      body: SafeArea(
        child:pages ,
      ) ,
    );
  }
}
