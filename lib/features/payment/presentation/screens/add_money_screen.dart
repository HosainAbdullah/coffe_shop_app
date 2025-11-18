import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/field/primary_text_form_field.dart';
import 'package:coffe_shop_app/features/payment/presentation/screens/successful_screen.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:flutter/material.dart';

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBackAppBar(),
        centerTitle: true,
        title: AppBarTitle(title: 'Add Money'),
      ),
      body: Padding(
        padding: SizeConfig.defaultPadding(),
        child: ListView(
          children: [
            // Wallet balance card
            Container(
              decoration: BoxDecoration(
                color: context.colors.bgPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: SizeConfig.defaultPadding(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wallet Balance',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: context.colors.textWeak),
                            ),

                            Text(
                              "\$12,000.00",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ],
                        ),
                        Container(
                          height: getScreenHeight(40),
                          width: getScreenWidth(40),
                          decoration: BoxDecoration(
                            color: context.colors.background,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.wallet,
                            color: context.colors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getScreenHeight(16)),
                    Wrap(
                      spacing: 8,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        AmountButton(amount: '+\$100'),
                        AmountButton(amount: '+\$200'),
                        AmountButton(amount: '+\$500'),
                        AmountButton(amount: '+\$1000'),
                        AmountButton(amount: '+\$2000'),
                        AmountButton(amount: '+\$3000'),
                        AmountButton(amount: '+\$4000'),
                        AmountButton(amount: '+\$5000'),
                      ],
                    ),
                    SizedBox(height: getScreenHeight(16)),
                    PrimaryTextFormField(
                      hintText: 'Enter Amount',
                      controller: TextEditingController(),
                      prefixIcon: Icon(Icons.attach_money_rounded),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: getScreenHeight(16)),
                    PrimaryButtonApp(
                      text: "Add Money",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuccessfulScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AmountButton extends StatelessWidget {
  final String amount;

  const AmountButton({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Logic to add the predefined amount
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.background,
        foregroundColor: context.colors.textDefault,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        minimumSize: Size(25, 40),
      ),
      child: Text(amount),
    );
  }
}
