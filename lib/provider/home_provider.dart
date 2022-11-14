import 'package:geniopay/emulated_api_data/user.dart';
import 'package:geniopay/model/user.dart';
import 'package:geniopay/provider/provider.dart';

class HomeProvider extends BaseProvider{

  late User _user;
  User get userData => _user;

  @override
  init() async {
   _getUser();
   super.init();
  }

  _getUser(){
    //todo -> get user from actual api call
    // todo -> set UI true
    _user = User.fromJson(user);
    // todo -> set UI false
  }

  dynamic viewAll() async{
    //when user click view all text, fetch all the data from the pagination.
  }
}