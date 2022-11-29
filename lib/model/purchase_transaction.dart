class PurchaseTransaction{
  late int id;
  late String entity;
  late String transDate;
  late num amount;
  late String status;

  PurchaseTransaction({required this.id,
  required this.entity, required this.transDate, required this.amount, required this.status});

  PurchaseTransaction.fromJson(Map<String, dynamic> data){

    id = data['id'];
    entity = data['entity'];
    transDate = data['trans_date'];
    amount = data['amount'];
    status = data['status'];
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'entity': entity,
      'trans_date': transDate,
      'amount' : amount,
      'status': status,
    };
  }
}