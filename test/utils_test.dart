import 'package:flutter_test/flutter_test.dart';
import 'package:geniopay/utils/Utils.dart';

void main(){

  test('Test Utility function', (){
    const amount = 1000000.5678;

    expect(Utils.moneyFormattedText(amount.toString()), '1,000,000.57');
  });

}