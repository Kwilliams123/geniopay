import 'package:flutter/material.dart';
import 'package:geniopay/model/transaction.dart';
import 'package:geniopay/view/international_transfer/international_transfer.dart';
import 'package:geniopay/widget/button.dart';
import 'package:geniopay/widget/dashboard_card.dart';
import 'package:geniopay/widget/delivery_time_card.dart';
import 'package:geniopay/widget/pay_card.dart';
import 'package:geniopay/widgetbook/screen_viewer.dart';
import 'package:geniopay/widgetbook/widget-viewer.dart';
import 'package:widgetbook/widgetbook.dart';

import '../emulated_api_data/transaction.dart';
import '../widget/payment_method_card.dart';
import '../widget/receiver_card.dart';
import '../widget/reference_card.dart';

void main() => runApp(WidgetBooks());


class WidgetBooks extends StatelessWidget {
  const WidgetBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'widgets',
          widgets: [
            WidgetbookComponent(
              name: 'Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'short name',
                  builder: (context) => WidgetViewer(LargeButton('Send Money', (){},)),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Cards',
              useCases: [
                WidgetbookUseCase(
                  name: 'Pay Card',
                  builder: (context) => const WidgetViewer(PayCard(title: 'Total to Pay', amount: '1000',)),
                ),
                WidgetbookUseCase(
                  name: 'Pay Method Card',
                  builder: (context) => const WidgetViewer(PaymentMethodCard()),
                ),
                WidgetbookUseCase(
                  name: 'Delivery Card',
                  builder: (context) => const WidgetViewer(DeliveryTimeCard()),
                ),

                WidgetbookUseCase(
                  name: 'Reference Card',
                  builder: (context) => const WidgetViewer(ReferenceCard()),
                ),
                WidgetbookUseCase(
                  name: 'Receiver Card',
                  builder: (context) => const WidgetViewer(ReceiverCard(srcImage: '',
                      name: 'Jane Smith', contact: '+433 8976 544')),
                ),
                WidgetbookUseCase(
                  name: 'Dashboard Card',
                  builder: (context) => WidgetViewer(DashboardCard(
                    transaction: Transaction.fromJson(transaction),
                    tapArrow: (){},
                  )),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Screens',
              useCases: [
                WidgetbookUseCase(
                  name: 'Internation Transfer',
                  builder: (context) => const ScreenViewer(InternationalTransfer()),
                ),
              ],
            )
          ],
        )
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
      appInfo: AppInfo(name: 'GenioPay'),
    );
  }
}
