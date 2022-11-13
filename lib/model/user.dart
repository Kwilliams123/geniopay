import 'package:geniopay/model/purchase_transaction.dart';

class User {
  late String name;
  late int id;
  late double balance;
  late int numRewards;
  late List<PurchaseTransaction> purchase;

  User({required this.id, required this.name, required this.balance,
    required this.numRewards, required this.purchase});

  User.fromJson(Map<String, dynamic> data){
    id = data['id'];
    name = data['name'];
    balance = data['balance'];
    numRewards = data['num_rewards'];
    purchase = data['purchase'];
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'name': name,
      'balance': balance,
      'num_rewards': numRewards,
      'purchase': purchase.map((e) => e.toJson())
    };
  }

}