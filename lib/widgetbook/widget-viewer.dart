import 'package:flutter/material.dart';

class WidgetViewer extends StatelessWidget {
  final Widget child;
  const WidgetViewer(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: child,
      );
  }
}
