import 'package:flutter/material.dart';
import 'package:geniopay/main.dart';
import 'package:geniopay/routes/routes.dart';
import 'package:geniopay/view/insurance/insurance_page_view.dart';
import 'package:geniopay/view/insurance/widget/insurance_plan.dart';
import 'package:geniopay/view/international_transfer/international_transfer.dart';
import 'package:geniopay/view/proof_identity/proof_identity.dart';
import 'package:geniopay/view/registration/registration_tax.dart';

import '../view/home/home.dart';

dynamic router = (RouteSettings settings){

  switch( settings.name ){

    case Routes.homeRoute:
      return MaterialPageRoute(builder: (context) => const Home());

    case Routes.registrationTaxRoute:
      return  MaterialPageRoute(builder: (context) =>  RegistrationTax());

    case Routes.internationTransferRoute:
      return MaterialPageRoute(builder: (context) => const InternationalTransfer());

    case Routes.proofIdentityRoute:
      dynamic args = settings.arguments;
      return MaterialPageRoute(builder: (context) => ProofIdentity(tapLink: args[0] ,
          tapArrowBack: args[1]));


    case Routes.insurancePlanRoute:
      return MaterialPageRoute(builder: (context) => const InsurancePageView());

  }
};