import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/provider/international_transfer_provider.dart';
import 'package:geniopay/utils/Utils.dart';
import 'package:geniopay/widget/button.dart';
import 'package:geniopay/widget/dashboard_card.dart';
import 'package:geniopay/widget/delivery_time_card.dart';
import 'package:geniopay/widget/payment_method_card.dart';
import 'package:geniopay/widget/receiver_card.dart';
import 'package:geniopay/widget/reference_card.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';
import '../../widget/pay_card.dart';

class InternationalTransfer extends StatefulWidget {
  const InternationalTransfer({super.key});

  @override
  State<InternationalTransfer> createState() => _InternationalTransferState();
}

class _InternationalTransferState extends State<InternationalTransfer> {

  late InternationTransferProvider vm;
  @override
  void initState() {
    vm = context.read<InternationTransferProvider>();
    vm.init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    vm = context.watch<InternationTransferProvider>();
    final schedule = SvgPicture.asset('svg/schedule.svg');
    final headerParent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onTap: () => vm.close(context),
        ),

        const Text(
          'International transfer',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
         InkWell(
                 child: const Icon(
                     Icons.help_outline_rounded,
                   color: Colors.black,
                    ),
                    onTap: (){},
                   ),
          ]
          ,

    );

    //final transaction = await vm.getTransaction();
     headerText(String text){
      return Align(
        alignment: Alignment.topLeft,
        child:Text(text,
              style: TextStyle(
              color: genioContainerColor[100],
             fontWeight: FontWeight.w500,
            fontSize: 14,
              ),
        ),);
    }

    void onArrowTap(){
      log('The Arrow was pressed');
    }

    final dashboard = DashboardCard(transaction: vm.transact,
        tapArrow: onArrowTap);
    final receiver = ReceiverCard(srcImage: vm.transact.receiver.imageSRC,
        name: vm.transact.receiver.name, contact: vm.transact.receiver.contact);

    const deliveryCard = DeliveryTimeCard();
    const paymentMethodCard = PaymentMethodCard();
    const referenceCard = ReferenceCard();

    final amount = (vm.transact.receiver.amount + vm.transact.transCharge).toString();

    final  amountToPayCard = PayCard(title: 'Amount to pay', amount: amount,);
    final sendButton = LargeButton('Send', () => vm.send(context));

    return Scaffold(

        body: SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            headerParent,
            const SizedBox(height: 30,),
            Align(
              alignment: Alignment.topRight,
              child: schedule,
            ),
            const SizedBox(height: 20,),
            dashboard,
            const SizedBox(height: 20,),
            headerText('Receiver',),
            const SizedBox(height: 20,),
            receiver,
            const SizedBox(height: 20,),
            headerText('Delivery time',),
            const SizedBox(height: 20,),
            deliveryCard,
            const SizedBox(height: 20,),
            headerText('Payment method',),
            const SizedBox(height: 20,),
            paymentMethodCard,
            const SizedBox(height: 20,),
            headerText('Reference',),
            const SizedBox(height: 20,),
            referenceCard,
            const SizedBox(height: 30,),
            amountToPayCard,
            const SizedBox(height: 30,),
            sendButton,
            const SizedBox(height: 30,),


          ],
        ),
      ),
        ),
    ),);
  }
}
