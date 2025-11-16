import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/buttons/circle_button_widget.dart';
import 'package:coffe_shop_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:coffe_shop_app/features/start/data/datasources/onboarding.dart';
import 'package:coffe_shop_app/features/start/presentation/controller/onboarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonsOnBoardingWidget extends StatelessWidget {
  final int currentPage;
  const ButtonsOnBoardingWidget({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SizeConfig.defaultPadding(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage > 0)
            CircleButtonWidget(
              onPressed: () {
                Provider.of<OnboardingProvider>(
                  context,
                  listen: false,
                ).pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              icon: Icons.arrow_back_ios,
              colorBorder: context.colors.primaryColor,
              color: context.colors.primaryColor,
              sizePadding: 15,
              sizeIcon: 18,
            )
          else
            SizedBox.shrink(),
          if (currentPage < onboarding.length - 1)
            CircleButtonWidget(
              onPressed: () {
                Provider.of<OnboardingProvider>(
                  context,
                  listen: false,
                ).pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              icon: Icons.arrow_forward_ios,
              colorBorder: context.colors.primaryColor,
              color: context.colors.background,
              sizePadding: 15,
              sizeIcon: 18,
              backgroundColor: context.colors.primaryColor,
            )
          else
            CircleButtonWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              icon: Icons.done,
              colorBorder: context.colors.primaryColor,
              color: context.colors.background,
              sizePadding: 15,
              sizeIcon: 18,
              backgroundColor: context.colors.primaryColor,
            ),
        ],
      ),
    );
  }
}
