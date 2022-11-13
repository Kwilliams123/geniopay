class Receiver {
   late int id;
   late String name;
   late double amount;
   late double totalAmount;

  Receiver({required this.id,
  required this.name,
  required this.amount,
  required this.totalAmount});

  Receiver.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    amount = data['amount'];
    totalAmount = data['total_amount'];
  }

    Map<String, dynamic> toJson(){
      return {
        'id': id,
        'name': name,
        'amount' : amount,
        'total_amount': totalAmount,
      };
    }

}