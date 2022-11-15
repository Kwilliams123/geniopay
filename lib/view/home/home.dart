import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/provider/home_provider.dart';
import 'package:geniopay/utils/utils.dart';
import 'package:geniopay/view/home/widget/round_items.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
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
        const SizedBox(
          width: 10,
        ),
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
                child: Center(
                  child: Text(
                    vm.userData.notificationCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Icon(
          Icons.help_outline_rounded,
          color: genioContainerColor[100],
        )
      ],
    );

    final greetingParent = Column(
      children: [
        Text(
          Utils.greetings(),
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: genioContainerColor[100]),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          vm.userData.name,
          style: TextStyle(
            color: genioContainerColor[100],
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        )
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
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        SvgPicture.asset('svg/star.svg'),
      ],
    );

    final iconsRewardParent = Column(
      children: [
        iconRow,
        const SizedBox(
          height: 6,
        ),
        rewardRow,
      ],
    );

    final avatar = CircleAvatar(
      radius: 30.0,
      backgroundColor: genioContainerColor[100],
      child: CircleAvatar(
        radius: 29.0,
        backgroundColor: genioContainerColor[100],
        child: ClipOval(
          child: vm.userData.srcImage.isEmpty
              ? Image.asset('images/avatar_2.png')
              : Image.network(vm.userData.srcImage),
        ),
      ),
    );

    final topRow = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              avatar,
              const SizedBox(
                width: 20,
              ),
              greetingParent,
            ],
          ),
          iconsRewardParent,
        ],
      ),
    );

    final usdArrow = Container(
      width: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: genioContainerColor[100]?.withOpacity(0.3)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          'USD',
          style: TextStyle(
            color: genioContainerColor[100],
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down_outlined,
          color: genioContainerColor[100],
        )
      ]),
    );

    final iconParent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RoundItems(text: 'Pay out', svg: 'pay_out', tapIcon: () {}),
        RoundItems(text: 'Pay in', svg: 'pay_in', tapIcon: () {}),
        RoundItems(text: 'Exchange', svg: 'exchange', tapIcon: () {}),
        RoundItems(text: 'More', svg: 'more', tapIcon: () {}),
      ],
    );

    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: homeGradientColors,
    );
    final middleParent = Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            30,
          ),
          border: Border.all(
            color: const Color(0xff008aa7),
            width: 2,
          )),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          'Total Balance',
          style: TextStyle(
            color: genioContainerColor[100],
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '\$${Utils.moneyFormattedText(
            vm.userData.balance.toString(),
          )}',
          style: TextStyle(
            color: genioContainerColor[100],
            fontWeight: FontWeight.w600,
            fontSize: 44,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        usdArrow,
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            height: 4,
            color: lineColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        iconParent,
      ]),
    );
    final home = Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: Column(
        children: [
          topRow,
          const SizedBox(
            height: 35,
          ),
          middleParent,
        ],
      ),
    );

    final bucket = PageStorageBucket();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
         child: SvgPicture.asset('svg/geniopay_logo.svg'),),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('svg/home_navigation.svg'),
              SvgPicture.asset('svg/transaction_navigation.svg'),
              SvgPicture.asset('svg/wallet_navigation.svg'),
              const Icon(Icons.menu_sharp,
              color: Colors.black,),
            ],
          ),
        ),
      ),
      body: PageStorage(
        bucket: bucket,
        child: home,
      ),
    );
  }
}
