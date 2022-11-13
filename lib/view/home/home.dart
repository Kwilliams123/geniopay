import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/constant/colors.dart';

class Home extends StatefulWidget{
  const Home({super.key});


  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {

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
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,

                ),

              ),
            )
          ],
        )
      ],
    );

    final greetingParent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children:  [
        Text(
          'Good Morning',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: genioContainerColor[100]
          ),
        )
      ],
    );
    return Container(

    );
  }
}