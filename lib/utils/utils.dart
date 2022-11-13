import 'dart:developer';

import 'package:intl/intl.dart';

class Utils {

  static moneyFormattedText(String text){
    try{
      double money = double.parse(text);
     final moneyFormat =  NumberFormat('#,###.##', 'en_US');

     return moneyFormat.format(money);
    }catch(ex){
      log(ex.toString());
      return 0.00;
    }
  }
}