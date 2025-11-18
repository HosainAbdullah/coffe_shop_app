import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/secondary_button_app.dart';
import 'package:flutter/material.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  final List<Map<String, String>> _coupons = const [
    {
      'code': 'WELCOME200',
      'description': 'Order items worth \$40 more to unlock',
      'offer': 'Get 50% OFF',
    },
    {
      'code': 'CASHBACK12',
      'description': 'Order items worth \$50 more to unlock',
      'offer': 'Up to \$12.00 cashback',
    },
    {
      'code': 'FEST2COST',
      'description': 'Order items worth \$25 more to unlock',
      'offer': 'Get 50% OFF for Combo',
    },
    {
      'code': 'WELCOME50',
      'description': 'Order items worth \$100 more to unlock',
      'offer': 'Get 10% OFF',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBackAppBar(),
        centerTitle: true,
        title: AppBarTitle(title: 'Coupon'),
      ),

      body: Padding(
        padding: SizeConfig.defaultPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coupons for you',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: getScreenHeight(16)),
            Expanded(
              child: ListView.builder(
                itemCount: _coupons.length,
                itemBuilder: (context, index) {
                  final coupon = _coupons[index];
                  return Padding(
                    padding: SizeConfig.bottomPadding(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.colors.background,
                        border: Border.all(
                          color: context.colors.borderDefault,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coupon['code']!,
                                  style:
                                      Theme.of(
                                        context,
                                      ).textTheme.headlineMedium,
                                ),
                                SizedBox(height: getScreenHeight(5)),
                                Text(
                                  coupon['description']!,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                SizedBox(height: getScreenHeight(8)),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_offer,
                                      color: context.colors.primaryColor,
                                      size: getFontSize(16),
                                    ),
                                    SizedBox(width: getScreenHeight(10)),
                                    Text(
                                      coupon['offer']!,
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleLarge,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SecondaryButtonApp(
                            text: 'COPY CODE',
                            onPressed: () {},
                          ),
                          // Container(
                          //   width: double.infinity,
                          //   decoration: const BoxDecoration(
                          //     color: Colors.grey,
                          //     borderRadius: BorderRadius.vertical(
                          //       bottom: Radius.circular(8),
                          //     ),
                          //   ),
                          //   child: TextButton(
                          //     onPressed: () {
                          //       // Copy code logic
                          //     },
                          //     child: const Text(
                          //       'COPY CODE',
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
