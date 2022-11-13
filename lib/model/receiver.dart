class Receiver {
   late int id;
   late String name;
   late double amount;
   late double totalAmount;
   late String contact;
   late String imageSRC;

  Receiver({required this.id,
  required this.name,
  required this.contact,
  required this.imageSRC,
  required this.amount,
  required this.totalAmount});

  Receiver.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    contact = data['contact'];
    imageSRC = data['image_src'];
    amount = data['amount'];
    totalAmount = data['total_amount'];
  }

    Map<String, dynamic> toJson(){
      return {
        'id': id,
        'name': name,
        'contact': contact,
        'image_src': imageSRC,
        'amount' : amount,
        'total_amount': totalAmount,
      };
    }

}