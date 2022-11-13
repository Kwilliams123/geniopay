import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:geniopay/provider/provider.dart';

import '../emulated_api_data/transaction.dart';
import '../model/transaction.dart';

class InternationTransferProvider extends BaseProvider{

  late Transaction transact = _getTransaction();
  @override
  init() async{
}
  @override
  reset() async{
    //Reset all the parameters
    super.reset();
  }

  _getTransaction(){
    //todo -> Get real transaction from api call
     return Transaction.fromJson(transaction);
  }

  dynamic send(BuildContext context) async{
    // do some network actions
    log('About to make some network call');
  }



}