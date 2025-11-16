import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/presentation/pages/successful_screen.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:flutter/material.dart';

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Money',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: ButtonBackAppBar(),
      ),
      body: Padding(
        padding: SizeConfig.horizontalPadding(),
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
                          height: 40,
                          width: 40,
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
                    TextFormField(
                      // controller: _nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: 'Enter Amount',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        // border: InputBorder.none,
                        filled: true,
                        fillColor: context.colors.background,
                      ),
                      cursorHeight: 25,
                      cursorColor: context.colors.primaryColor,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: getScreenHeight(16)),
                    ElevatedButton(
                      onPressed: () {
                        // SuccessfulScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuccessfulScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.primaryColor,
                        foregroundColor: context.colors.secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: Size(
                          MediaQuery.of(context).size.width,
                          55,
                        ),
                      ),
                      child: Text(
                        'Add Money',
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(color: context.colors.background),
                      ),
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
