import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geniopay/main.dart';
import 'package:geniopay/model/transaction.dart';
import 'package:geniopay/view/home/home.dart';
import 'package:geniopay/view/home/home_bottom_sheet.dart';
import 'package:geniopay/view/insurance/insurance.dart';
import 'package:geniopay/view/insurance/widget/insurance_plan.dart';
import 'package:geniopay/view/international_transfer/international_transfer.dart';
import 'package:geniopay/view/proof_identity/proof_identity.dart';
import 'package:geniopay/view/registration/registration_tax.dart';
import 'package:geniopay/view/registration/widget/country_tin.dart';
import 'package:geniopay/widget/button.dart';
import 'package:geniopay/widget/dashboard_card.dart';
import 'package:geniopay/widget/delivery_time_card.dart';
import 'package:geniopay/widget/pay_card.dart';
import 'package:geniopay/widgetbook/other_widgets_viewer.dart';
import 'package:geniopay/widgetbook/screen_viewer.dart';
import 'package:geniopay/widgetbook/widget-viewer.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/widgetbook.dart';

import '../emulated_api_data/transaction.dart';
import '../view/proof_identity/widget/description_row.dart';
import '../view/registration/widget/country_selection.dart';
import '../widget/payment_method_card.dart';
import '../widget/receiver_card.dart';
import '../widget/reference_card.dart';
import '../constant/init_provider.dart';
import '../widget/text_input_field.dart';

void main() => runApp(WidgetBooks());

class WidgetBooks extends StatelessWidget {
  const WidgetBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
                  builder: (context) => WidgetViewer(LargeButton(
                    'Send Money',
                    () {},
                  )),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Other Widgets',
              useCases: [
                WidgetbookUseCase(
                  name: 'Basic Plan',
                  builder: (context) =>
                      const OtherWidgetsViewer(child: InsurancePlan()),
                ),
                WidgetbookUseCase(
                  name: 'Gold Plan',
                  builder: (context) => const OtherWidgetsViewer(
                      child: InsurancePlan(
                    planName: 'Gold Plan',
                    spendUpTo: '400',
                    getUpTo: '10,000',
                  )),
                ),
                WidgetbookUseCase(
                  name: 'Premium Plan',
                  builder: (context) => const OtherWidgetsViewer(
                      child: InsurancePlan(
                    planName: 'Premium Plan',
                    spendUpTo: '600',
                    getUpTo: '15,000',
                  )),
                ),
                WidgetbookUseCase(
                  name: 'Identity Row',
                  builder: (context) => WidgetViewer(DescriptionRow(
                    title: 'Valid Government Issued ID Document Scan',
                    svg: 'issued_card',
                    linkText: 'learn more',
                    onLinkTap: () {},
                  )),
                ),
                WidgetbookUseCase(
                  name: 'Input Field',
                  builder: (context) => WidgetViewer(TextInputField(
                    controller: controller,
                  )),
                ),
                WidgetbookUseCase(
                  name: 'Country Selection',
                  builder: (context) => WidgetViewer(
                    CountrySelection(
                      countryName: 'Brazil',
                      onTap: (){},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Country Tin',
                  builder: (context) => WidgetViewer(
                    CountryTin(controller: controller,
                      arrowDownTap: (){},
                      deleteButtonTap: (){},
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Cards',
              useCases: [
                WidgetbookUseCase(
                  name: 'Pay Card',
                  builder: (context) => const WidgetViewer(PayCard(
                    title: 'Total to Pay',
                    amount: '1000',
                  )),
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
                  builder: (context) => const WidgetViewer(ReceiverCard(
                      srcImage: '',
                      name: 'Jane Smith',
                      contact: '+433 8976 544')),
                ),
                WidgetbookUseCase(
                  name: 'Dashboard Card',
                  builder: (context) => WidgetViewer(DashboardCard(
                    transaction: Transaction.fromJson(transaction),
                    tapArrow: () {},
                  )),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Screens',
              useCases: [
                WidgetbookUseCase(
                  name: 'Internation Transfer',
                  builder: (context) =>
                      const ScreenViewer(InternationalTransfer()),
                ),
                WidgetbookUseCase(
                  name: 'Proof Identity',
                  builder: (context) => ScreenViewer(ProofIdentity(
                    tapArrowBack: () {},
                    tapLink: () {},
                  )),
                ),
                WidgetbookUseCase(
                  name: 'Home Page',
                  builder: (context) => const ScreenViewer(Home()),
                ),
                WidgetbookUseCase(
                  name: 'Insurance Page',
                  builder: (context) => const ScreenViewer(Insurance()),
                ),
                WidgetbookUseCase(
                  name: 'Registration Tax Page',
                  builder: (context) => const ScreenViewer(RegistrationTax()),
                ),
              ],
            ),
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
