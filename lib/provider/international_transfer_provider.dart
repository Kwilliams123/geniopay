import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/provider/provider.dart';

import '../emulated_api_data/transaction.dart';
import '../model/transaction.dart';

class InternationTransferProvider extends BaseProvider {
  late Transaction transact = _getTransaction();

  @override
  init() async {}

  @override
  reset() async {
    //Reset all the parameters
    super.reset();
  }

  _getTransaction() {
    //todo -> Get real transaction from api call
    return Transaction.fromJson(transaction);
  }

  send(BuildContext context) async {
    // do some network actions

    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: genioContainerColor[50],
          content: Text(
            'Transaction was successful',
            style: TextStyle(
              color: genioContainerColor[100],
            ),
        ),
      ),
    );
  }

  close(BuildContext context) => Navigator.of(context).pop();
}
