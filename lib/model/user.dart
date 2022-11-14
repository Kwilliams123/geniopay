import 'package:geniopay/model/purchase_transaction.dart';

class User {
  late String name;
  late int id;
  late String srcImage;
  late double balance;
  late int numRewards;
  late int notificationCount;
  late List<PurchaseTransaction> purchase;

  User({required this.id, required this.name, required this.srcImage,
    required this.balance,
    required this.numRewards, required this.notificationCount,
    required this.purchase});

  User.fromJson(Map<String, dynamic> data){
    id = data['id'];
    name = data['name'];
    srcImage = data['src_image'];
    balance = data['balance'];
    numRewards = data['num_rewards'];
    notificationCount = data['notification_count'];
    purchase = data['purchase'];
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'name': name,
      'src_image': srcImage,
      'balance': balance,
      'num_rewards': numRewards,
      'notification_count': notificationCount,
      'purchase': purchase.map((e) => e.toJson())
    };
  }

}