import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/init_provider.dart';
import '../constant/router.dart';
import '../routes/routes.dart';

class Flows extends StatelessWidget {
  const Flows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: router,
        initialRoute: Routes.registrationTaxRoute,
      ),
    );
  }
}
