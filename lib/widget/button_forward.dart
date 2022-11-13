import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonForward extends StatelessWidget {
  final VoidCallback callback;
  const ButtonForward(this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = SvgPicture.asset('svg/genio-arrow-forward.svg');
    return InkWell(
      onTap: callback,
      child: button,
    );
  }
}
