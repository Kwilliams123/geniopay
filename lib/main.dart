import 'package:flutter/material.dart';
import 'package:geniopay/view/home/home.dart';

void main() {
  runApp(
     /* LicenseRegistry.addLicense(() async* {
        final license = await rootBundle.loadString('fonts/OFL.txt');
        yield LicenseEntryWithLineBreaks(['google_fonts'], license);
      });*/

      const HomePage()
  );
}



class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primarySwatch: Colors.blue
     ),
     home: const Scaffold(
       body: SafeArea(child: Home(),),
     ),
   );
  }
}


