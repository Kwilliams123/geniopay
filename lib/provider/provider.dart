import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseProvider extends ChangeNotifier{

  bool _isLoading = false;


  void init() async{}
  void reset() async{}


  // check when API call is made and UI is loading
  get isLoading => _isLoading;

  setLoading(bool loading){
    _isLoading = loading;
  }
}