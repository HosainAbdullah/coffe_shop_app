import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:flutter/material.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        // title: Text(
        //   'Your Profile',
        //   style: Theme.of(context).textTheme.titleMedium,
        // ),
        leading: ButtonBackAppBar(),
      ),
      body: Padding(
        padding: SizeConfig.symmetricPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: context.colors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_rounded,
                color: context.colors.background,
                size: 90,
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
      bottomSheet: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.colors.background,
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeConfig.defaultRadius()),
            topRight: Radius.circular(SizeConfig.defaultRadius()),
          ),
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.5)],
        ),
        child: Padding(
          padding: SizeConfig.defaultPadding(size: 16),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle button press (e.g., navigate to the next screen)
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.primaryColor,
                  foregroundColor: context.colors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(MediaQuery.of(context).size.width, 55),
                ),
                child: Text(
                  'Ok',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: context.colors.background,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
