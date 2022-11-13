import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/init_provider.dart';

class ScreenViewer extends StatelessWidget {
  final Widget child;
  const ScreenViewer(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: providers,
    child: child,);
  }
}
