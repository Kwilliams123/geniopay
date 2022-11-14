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

  static rewardFormattedText(dynamic reward){
    try{
      final rewardFormat =  NumberFormat('#,###', 'en_US');

      return rewardFormat.format(reward).replaceAll(',', ' ');
    }catch(ex){
      log(ex.toString());
      return '0';
    }
  }

  static time(Duration duration, {bool format = false}) {
    var dateAndDuration =  DateTime.now().add(duration);
    if(!format){
      return dateAndDuration;
    }else{
      return formatTime(dateAndDuration);
    }
  }

    static  formatTime(DateTime date, {String format = 'yyyy.dd.MM'}){
      //If wrong format is provided use the YYYY.dd.MM format
      try{
        return DateFormat(format).format(date);
      }catch(ex){
        return DateFormat('yyyy.dd.MM').format(date);
      }
    }

    static greetings() => 'Good ${DateTime.now().hour < 12 ? 'Morning' :
    DateTime.now().hour < 16 ? 'Afternoon' :'Evening'}';

  }

