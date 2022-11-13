import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';
class LargeButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;
  const LargeButton(this.text, this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20,),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8)
        ),
        color: largeButtonColor
      ),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w200
        ),
        textAlign: TextAlign.center
      ),

    );
  }
}
