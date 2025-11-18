import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/bottom_background_widget.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/field/primary_text_form_field.dart';
import 'package:coffe_shop_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:coffe_shop_app/features/cart/presentation/screens/order_success_screen.dart';
import 'package:flutter/material.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  String _holderName = 'Esther Howard';
  String _cardNumber = '4716 9627 1635 8047';
  String _expiryDate = '02/30';
  String _cvv = '000';
  bool _saveCard = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBackAppBar(),
        centerTitle: true,
        title: AppBarTitle(title: 'Add Card'),
      ),

      body: SingleChildScrollView(
        padding: SizeConfig.defaultPadding(),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: getScreenHeight(180),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    SizeConfig.defaultRadius(),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      context.colors.secondaryColor,
                      context.colors.primaryColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: SizeConfig.defaultPadding(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'VISA',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge?.copyWith(
                          fontSize: getFontSize(24),
                          color: context.colors.background,
                        ),
                      ),
                    ),
                    Text(
                      _cardNumber,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontSize: getFontSize(20),
                        color: context.colors.background,
                        letterSpacing: 2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Card holder name',
                              style: Theme.of(
                                context,
                              ).textTheme.labelSmall?.copyWith(
                                color: context.colors.background.withAlpha(200),
                              ),
                            ),
                            Text(
                              _holderName,
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(color: context.colors.background),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expiry date',
                              style: Theme.of(
                                context,
                              ).textTheme.labelSmall?.copyWith(
                                color: context.colors.background.withAlpha(200),
                              ),
                            ),
                            Text(
                              _expiryDate,
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(color: context.colors.background),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.credit_card,
                          color: context.colors.background,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: getScreenHeight(24)),
              Text(
                'Card Holder Name',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: getScreenHeight(10)),
              PrimaryTextFormField(
                initialValue: _holderName,
                onChanged: (value) => setState(() => _holderName = value),
              ),
              SizedBox(height: getScreenHeight(16)),
              Text(
                'Card Number',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: getScreenHeight(10)),
              PrimaryTextFormField(
                initialValue: _cardNumber,
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() => _cardNumber = value),
              ),
              SizedBox(height: getScreenHeight(16)),

              Row(
                spacing: getScreenWidth(16),
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expiry Date',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(height: getScreenHeight(10)),
                        PrimaryTextFormField(
                          initialValue: _expiryDate,
                          keyboardType: TextInputType.datetime,
                          onChanged:
                              (value) => setState(() => _expiryDate = value),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CVV',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(height: getScreenHeight(10)),
                        PrimaryTextFormField(
                          initialValue: _cvv,
                          keyboardType: TextInputType.number,
                          onChanged: (value) => setState(() => _cvv = value),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: getScreenHeight(6)),
              CheckboxWidget(
                value: _saveCard,
                onChanged: (bool? value) {
                  setState(() {
                    _saveCard = value!;
                  });
                },
                text: "Save Card",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBackGroundWidget(
        child: PrimaryButtonApp(
          text: "Add Card",
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Add card logic
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderSuccessScreen(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
