import 'package:flutter/material.dart';
import 'package:geniopay/view/home/home.dart';
import 'package:provider/provider.dart';

import 'constant/init_provider.dart';

void main() {
  runApp(
      /* LicenseRegistry.addLicense(() async* {
        final license = await rootBundle.loadString('fonts/OFL.txt');
        yield LicenseEntryWithLineBreaks(['google_fonts'], license);
      });*/

      const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SafeArea(
          child: Home(),
        ),
      ),
    );
  }
}
