import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/bottom_background_widget.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:flutter/material.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppBarTitle(title: 'Successful'),
        leading: ButtonBackAppBar(),
      ),
      body: Padding(
        padding: SizeConfig.symmetricPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: getScreenHeight(120),
              width: getScreenWidth(120),
              decoration: BoxDecoration(
                color: context.colors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_rounded,
                color: context.colors.background,
                size: 60,
              ),
            ),
            SizedBox(height: getScreenHeight(20)),
            Text(
              "To Up Successful!",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: getScreenHeight(10)),
            Padding(
              padding: SizeConfig.horizontalPadding(size: 75),
              child: Text(
                'You have successful Top-Up e-wallet for \$500.00',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: context.colors.textWeak,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBackGroundWidget(
        child: PrimaryButtonApp(text: "Ok", onPressed: () {}),
      ),
    );
  }
}
