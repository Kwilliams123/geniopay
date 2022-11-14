import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geniopay/constant/colors.dart';
import 'package:geniopay/model/purchase_transaction.dart';
import 'package:geniopay/utils/Utils.dart';
import 'package:geniopay/widget/round_name.dart';

class TransactionRow extends StatelessWidget {
  final PurchaseTransaction purchase;
  const TransactionRow({required this.purchase, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(purchase.entity,
        style: TextStyle(
          color: textColor[150],
          fontWeight: FontWeight.w400,
          fontSize: 13,
        ),),
        Text(
          '-\$ ${Utils.moneyFormattedText(purchase.amount.toString())}',
          style: TextStyle(
            color: textColor[250],
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        )
      ],
    );

    final bottomRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
            Text(
              purchase.transDate,
              style: TextStyle(
                color: textColor[200],
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
            ),
        Text(
          purchase.status,
          style: TextStyle(
            color: transactionColor[purchase.status],
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),
        ),
      ],
    );
    return Row(
      children: [
        // only spotify and dribble are in the svg folder for now.
        (purchase.entity.toLowerCase() == 'spotify' ||
            purchase.entity.toLowerCase() == 'dribble' )?
         SvgPicture.asset('svg/${purchase.entity.toLowerCase()}.svg') :
            RoundName(text: purchase.entity),
        const SizedBox(width: 20,),
        Row(
          children: [
            topRow,
            bottomRow
          ],
        )
      ],
    );
  }
}
