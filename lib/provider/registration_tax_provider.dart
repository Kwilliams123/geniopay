import 'package:flutter/material.dart';
import 'package:geniopay/provider/provider.dart';
import 'package:geniopay/routes/routes.dart';
import 'package:geniopay/view/registration/widget/country_tin.dart';

class RegistrationTaxProvider extends BaseProvider{

  bool declaration1 = false;
  bool declaration2 = false;
  bool declaration3 = false;
   List<CountryTin> countryTin = [];



  @override
  init() async{
  }

  @override
  reset() async{

  }

  onContinue(BuildContext context) async {
    // do all network stuffs
    Navigator.of(context).popAndPushNamed(Routes.proofIdentityRoute, arguments: [(){}, (){}]);
  }




}