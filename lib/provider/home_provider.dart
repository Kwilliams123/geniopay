import 'package:geniopay/emulated_api_data/promotions.dart';
import 'package:geniopay/emulated_api_data/user.dart';
import 'package:geniopay/model/user.dart';
import 'package:geniopay/provider/provider.dart';

import '../model/promotions.dart';

class HomeProvider extends BaseProvider{

  late User _user;
  late bool showBalance;
  late List<Promotions> _promotion;
  User get userData => _user;
  List<Promotions> get promotion => _promotions();

  @override
  init() async {
   _getUser();
   //_promotions();
   showBalance = true;
   super.init();
  }

  @override
  reset() async {

  }

  _getUser(){
    //todo -> get user from actual api call
    // todo -> set UI true
    _user = User.fromJson(user);
    // todo -> set UI false
  }

  toggleShowBalance(){
    showBalance = !showBalance;
  }

  _promotions(){
    return List<Promotions>.from(
        promotions.map((e) => Promotions.fromJson(e)));
  }

  dynamic viewAll() async{
    //when user click view all text, fetch all the data from the pagination.
  }
}