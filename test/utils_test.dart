import 'package:flutter_test/flutter_test.dart';
import 'package:geniopay/utils/Utils.dart';

void main(){

  test('Test Utility function', (){
    const amount = 1000000.5678;
    const dateNovember = DateTime.november;

    const  duration = Duration(days: 5);
    const numReward = 10000;
    const invalidReward = '300a';

    //check to see if greetings will be returned based on the time of the day
    expect(Utils.greetings(), 'Good Afternoon');

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

}