import 'package:geniopay/provider/international_transfer_provider.dart';
import 'package:geniopay/provider/registration_tax_provider.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

final providers = [
//ChangeNotifierProvider(create: (_) => InternationTransferProvider(),),
//ChangeNotifierProvider(create: (_) => HomeProvider(),),
  ChangeNotifierProvider(create: (_) => RegistrationTaxProvider(),),
];