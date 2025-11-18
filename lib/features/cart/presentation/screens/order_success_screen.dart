import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/bottom_background_widget.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/buttons/secondary_button_app.dart';
import 'package:coffe_shop_app/features/payment/presentation/screens/ereceipt_screen.dart';
import 'package:coffe_shop_app/features/cart/presentation/screens/review_summary_screen.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBackAppBar(),
        centerTitle: true,
        title: AppBarTitle(title: 'Successfully'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: getScreenWidth(80),
              height: getScreenHeight(80),
              decoration: BoxDecoration(
                color: context.colors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_rounded,
                color: context.colors.background,
                size: getFontSize(50),
              ),
            ),
            SizedBox(height: getScreenHeight(24)),
            Text(
              'Your Order Placed',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontSize: getFontSize(22)),
            ),
            Text(
              'Successfully!',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontSize: getFontSize(24)),
            ),
            SizedBox(height: getScreenHeight(16)),
            Text(
              'You can track the order in the',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: getScreenHeight(5)),
            Text(
              '"My Orders" section.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBackGroundWidget(
        height: getScreenHeight(160),
        child: Column(
          children: [
            PrimaryButtonApp(
              text: "View Order",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewSummaryScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: getScreenHeight(16)),
            SecondaryButtonApp(
              text: "View E-Receipt",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EReceiptScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
