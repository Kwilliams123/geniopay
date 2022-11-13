import 'package:geniopay/model/receiver.dart';

class Transaction {
  late int id;
  late double exchangeRate;
  late String sendFrom;
  late String sendTo;
  late String fromCode;
  late String toCode;
  late Receiver receiver;


  Transaction({
    required this.id,
    required this.exchangeRate,
    required this.sendFrom,
    required this.sendTo,
    required this.fromCode,
    required this.toCode,
    required this.receiver
  });

  Transaction.fromJson(Map data) {
    id = data['id'];
    exchangeRate = data['exchange_rate'];
    sendFrom = data['send_from'];
    sendTo = data['send_to'];
    fromCode = data['from_code'];
    toCode = data['to_code'];
    receiver = Receiver.fromJson(data['receiver']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'exchange_rate': exchangeRate,
      'send_from': sendFrom,
      'send_to': sendTo,
      'from_code': fromCode,
      'to_code': toCode,
      'receiver': receiver.toJson(),
    };
  }
}