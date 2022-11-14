import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/provider/home_provider.dart';
import 'package:geniopay/utils/utils.dart';
import 'package:geniopay/view/home/widget/round_items.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget{
  const Home({super.key});


  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  late HomeProvider vm;
  @override
  void initState() {
    vm = context.read<HomeProvider>();
    vm.init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    vm = context.watch<HomeProvider>();

    final iconRow = Row(
      children: [
        SvgPicture.asset('svg/tree.svg'),
        const SizedBox(width: 10,),
        Stack(
          children: [
            Icon(
              Icons.notifications_none,
              color: genioContainerColor[100],
            ),
            Positioned(
              top: 0,
                right: 0,
              child: Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  vm.userData.notificationCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 8,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 10,),
        Icon(
          Icons.help_outline_rounded,
          color: genioContainerColor[100],
        )
      ],
    );

    final greetingParent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children:  [
        Text(
          Utils.greetings(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: genioContainerColor[100]
          ),
        ),
        iconRow,
      ],
    );

    final rewardRow = Row(
      children: [
        Text(
          Utils.rewardFormattedText(vm.userData.numRewards),
        style: TextStyle(
          color: genioContainerColor[100],
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),),
        const SizedBox(width: 5,),
        SvgPicture.asset('svg/star.svg'),
      ],
    );
    
    final personNameParent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Text(vm.userData.name,
       style: TextStyle(
         color: genioContainerColor[100],
         fontWeight: FontWeight.w700,
         fontSize: 18,
       ),),
        rewardRow,
      ],
    );
    
    final namedGreetingsParent = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      greetingParent,
      personNameParent,  
      ],
    );
    
    final avatar =  CircleAvatar(
      radius: 30.0,
      backgroundColor: genioContainerColor[100],
      child: CircleAvatar(
          radius: 29.0,
          backgroundColor: genioContainerColor[100],
        child:  ClipOval(
      child: vm.userData.srcImage.isEmpty ?
        Image.asset('images/avatar_2.png') :
        Image.network(vm.userData.srcImage),
      ),
    ),);
    
    final topRow = Row(
      children: [
         avatar,
         const SizedBox(width: 10,),
        namedGreetingsParent,
      ],
    );

    final usdArrow = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: genioContainerColor[100]?.withOpacity(0.3)
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Text('USD',
        style: TextStyle(
          color: genioContainerColor[100],
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),),
          const SizedBox(width: 5,),
          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: genioContainerColor[100],
          )
        ]
    ), );

    final iconParent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RoundItems(text: 'Pay out', svg: 'pay_out', tapIcon: (){}),
        RoundItems(text: 'Pay in', svg: 'pay_in', tapIcon: (){}),
        RoundItems(text: 'Exchange', svg: 'exchange', tapIcon: (){}),
        RoundItems(text: 'More', svg: 'more', tapIcon: (){}),
      ],
    );

    final middleParent = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Total Balance',
          style: TextStyle(
            color: genioContainerColor[100],
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 20,),
        Text(
          '\$${Utils.moneyFormattedText(vm.userData.balance.toString(),)}',
          style: TextStyle(
            color: genioContainerColor[100],
            fontWeight: FontWeight.w600,
            fontSize: 44,
          ),
        ),
        const SizedBox(height: 20,),
        usdArrow,
        const SizedBox(height: 20 ,),
        const Expanded(child: Divider(
          color: lineColor,
            ),
            ),
        const SizedBox(height: 10,),
        iconParent,
      ]
    );
    
    return Container(
     color: genioContainerColor[50],
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          topRow,
          middleParent,

        ],
      ),
    );
  }
}