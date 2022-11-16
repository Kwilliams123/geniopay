import 'package:flutter/material.dart';

class OtherWidgetsViewer extends StatelessWidget {
  final Widget child;
  const OtherWidgetsViewer({required this.child , Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: child,
      ),
    );
  }
}
