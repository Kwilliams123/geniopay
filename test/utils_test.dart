import 'dart:convert';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:geniopay/model/purchase_transaction.dart';
import 'package:geniopay/model/user.dart';
import 'package:geniopay/utils/Utils.dart';

void main(){

  test('Test Utility function', (){
    const amount = 1000000.5678;
    const dateNovember = DateTime.november;

    const  duration = Duration(days: 5);
    const numReward = 10000;
    const invalidReward = '300a';

    //check to see if greetings will be returned based on the time of the day
    expect(Utils.greetings(), 'Good Evening');

    // 5 days was added to today in
    expect(Utils.time(duration, format: true), '2022.19.11');

    // format the String to the nearest hundredths
    expect(Utils.moneyFormattedText(amount.toString()), '1,000,000.57');

    // for the reward text
    expect( Utils.rewardFormattedText(numReward), '10 000');

    /* Methods arguments which throws exceptions
     and returns values from catch */

    expect(Utils.rewardFormattedText(invalidReward), '0');


  });

  test('Model Test', (){

      final purchase1 = PurchaseTransaction(
        id: 1,
        entity: 'Spotify',
        transDate: Utils.time(const Duration(days: 7), format: true),
          amount: 58,
          status: 'In Progress',
      );

      final purchase2 = PurchaseTransaction(
        id: 1,
        entity: 'Apple',
        transDate: Utils.time(const Duration(days: 20), format: true),
        amount: 99,
        status: 'Completed',
      );

    final User user = User(
      id: 1,
      name: 'Williams Konadu',
      srcImage: '',
      balance: 3500.89,
      numRewards: 350988,
      notificationCount: 6,
      purchase: [purchase1, purchase2]
    ) ;

    final User user1 = User.fromJson(user.toJson());

      // expect that user unpacking stills give the packed data

    expect(user1.toJson(), user.toJson());

  });



}