import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';
class LargeButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;
  final Color color;
  const LargeButton(this.text, this.callback, {this.color = largeButtonColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
    onTap: callback,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20,),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8)
        ),
        color: color
      ),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w200
        ),
        textAlign: TextAlign.center
      ),
    ),
    );
  }
}
