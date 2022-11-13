import 'package:geniopay/provider/international_transfer_provider.dart';
import 'package:provider/provider.dart';

final providers = [
ChangeNotifierProvider(create: (_) => InternationTransferProvider(),
),
];