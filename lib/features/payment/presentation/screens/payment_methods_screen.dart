import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/bottom_background_widget.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/features/payment/presentation/screens/add_card_screen.dart';
import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  String _selectedMethod = 'Wallet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBackAppBar(),
        centerTitle: true,
        title: AppBarTitle(title: 'Payment Methods'),
      ),
      body: Padding(
        padding: SizeConfig.defaultPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cash', style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: getScreenHeight(10)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: context.colors.borderDefault,
                ),
              ),
              child: RadioListTile<String>(
                value: 'Cash',
                groupValue: _selectedMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedMethod = value!;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fillColor: WidgetStateProperty.all<Color>(
                  context.colors.primaryColor,
                ),
                title: Text(
                  'Cash',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                secondary: Icon(
                  Icons.money,
                  color: context.colors.primaryColor,
                ),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            SizedBox(height: getScreenHeight(10)),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.headlineMedium,
                children: [
                  TextSpan(text: "Wallet "),
                  TextSpan(
                    text: "(Balance: \$1200.00)",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: context.colors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getScreenHeight(10)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: context.colors.borderDefault,
                ),
              ),
              child: RadioListTile<String>(
                value: 'Wallet',
                groupValue: _selectedMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedMethod = value!;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fillColor: WidgetStateProperty.all<Color>(
                  context.colors.primaryColor,
                ),
                title: Text(
                  'Wallet',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                secondary: Icon(
                  Icons.wallet,
                  color: context.colors.primaryColor,
                ),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ),
            SizedBox(height: getScreenHeight(10)),
            Text(
              'Credit & Debit Card',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: getScreenHeight(10)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: context.colors.borderDefault,
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.credit_card,
                  color: context.colors.primaryColor,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                title: Text(
                  'Add Card',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Navigate to add card screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCardScreen()),
                  );
                },
              ),
            ),

            SizedBox(height: getScreenHeight(10)),
            Text(
              'More Payment Options',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: getScreenHeight(10)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: context.colors.borderDefault,
                ),
              ),
              child: Column(
                children: [
                  RadioListTile<String>(
                    value: 'PayPal',
                    groupValue: _selectedMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedMethod = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                    ),
                    fillColor: WidgetStateProperty.all<Color>(
                      context.colors.primaryColor,
                    ),
                    title: Text(
                      'PayPal',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    secondary: Icon(
                      Icons.payment,
                      color: context.colors.primaryColor,
                    ),

                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  Divider(color: context.colors.shadowColor, height: 1),
                  RadioListTile<String>(
                    value: 'Apple Pay',
                    groupValue: _selectedMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedMethod = value!;
                      });
                    },

                    fillColor: WidgetStateProperty.all<Color>(
                      context.colors.primaryColor,
                    ),
                    title: Text(
                      'Apple Pay',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    secondary: Icon(
                      Icons.apple,
                      color: context.colors.primaryColor,
                    ),

                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  Divider(color: context.colors.shadowColor, height: 1),
                  RadioListTile<String>(
                    value: 'Google Pay',
                    groupValue: _selectedMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedMethod = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(15),
                      ),
                    ),
                    fillColor: WidgetStateProperty.all<Color>(
                      context.colors.primaryColor,
                    ),
                    title: Text(
                      'Google Pay',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    secondary: Icon(
                      Icons.payment,
                      color: context.colors.primaryColor,
                    ),
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBackGroundWidget(
        child: PrimaryButtonApp(text: "Confirm Payment", onPressed: () {}),
      ),
    );
  }
}
