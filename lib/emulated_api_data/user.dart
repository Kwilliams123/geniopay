import 'package:geniopay/constant/status.dart';
import 'package:geniopay/utils/utils.dart';

final List<Map<String, dynamic>> purchaseTransaction = [{
  'id': 1,
  'entity': 'Netflix',
  'trans_date': Utils.time(const Duration(days: 5), format: true),
  'amount' : 300,
  'status': status[1],

},{
  'id': 2,
  'entity': 'Dribble',
  'trans_date': Utils.time(const Duration(days: 8), format: true),
  'amount' : 49,
  'status': status[2],
},{
  'id': 3,
  'entity': 'Spotify',
  'trans_date': Utils.time(const Duration(days: 8), format: true),
  'amount' : 500,
  'status': status[2],
},{
  'id': 4,
  'entity': 'Dribble',
  'trans_date': Utils.time(const Duration(days: 9), format: true),
  'amount' : 790,
  'status': status[1],
},{
  'id': 5,
  'entity': 'Jane Smith',
  'trans_date': Utils.time(const Duration(days: 10), format: true),
  'amount' : 1000,
  'status': status[1],
},{
  'id': 6,
  'entity': 'Spotify',
  'trans_date': Utils.time(const Duration(days: 10), format: true),
  'amount' : 99,
  'status': status[2],
}, {
  'id': 1,
  'entity': 'Dribble',
  'trans_date': Utils.time(const Duration(days: 11), format: true),
  'amount' : 56.78,
  'status': status[1],
}];

final Map<String, dynamic> user = {
  'id' : 1,
  'name': 'New Genius',
  'src_image': '',
  'balance': 450.49,
  'num_rewards': 10000,
  'notification_count': 5,
  'purchase': purchaseTransaction,
};
