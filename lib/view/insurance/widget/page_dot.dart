import 'package:flutter/material.dart';

class PageDot extends StatelessWidget {
  final double size;
  final Color color;
  const PageDot({this.color =  const Color(0xff008aa7),
    this.size = 8,  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:1,),
      width: size ,
     height: size,
     decoration: BoxDecoration(
       shape: BoxShape.circle,
       color: size < 12 ? color.withOpacity(0.3) : color,
     ),
    );
  }
}
