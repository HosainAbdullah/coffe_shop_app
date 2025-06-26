import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/data/datasources/onboarding.dart';
import 'package:coffe_shop_app/presentation/controller/onboarding_provider.dart';
import 'package:coffe_shop_app/presentation/pages/sign_up_screen.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/circle_button_widget.dart';
import 'package:coffe_shop_app/presentation/widgets/image_show_welcome_and_onboarding.dart';
import 'package:coffe_shop_app/presentation/widgets/sub_title_in_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ! Done
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller:
                  Provider.of<OnboardingProvider>(context).pageController,
              itemCount: onboarding.length,
              onPageChanged:
                  Provider.of<OnboardingProvider>(context).onPageChanged,
              itemBuilder: (context, index) {
                return onboarding[index];
              },
            ),
          ),
          _buildIndicator(context),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildIndicator(BuildContext context) {
    int currentPage = Provider.of<OnboardingProvider>(context).currentPage;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboarding.length,
        (index) => Container(
          width: currentPage == index ? getScreenWidth(12) : getScreenWidth(8),
          height:
              currentPage == index ? getScreenHeight(12) : getScreenHeight(8),
          margin: SizeConfig.horizontalPadding(size: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                currentPage == index
                    ? context.colors.primaryColor
                    : context.colors.textWeak,
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    int currentPage = Provider.of<OnboardingProvider>(context).currentPage;
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

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAsset;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ImageShowWelcomeAndOnBoarding(
              imageUrl: imageAsset,
              height: MediaQuery.of(context).size.height * 0.65,
            ),
            SkipButton(),
          ],
        ),
        SizedBox(height: getScreenHeight(10)),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.displayLarge?.copyWith(fontSize: getFontSize(24)),
        ),
        SizedBox(height: getScreenHeight(16)),
        SubTitleInStartScreen(text: subtitle),
      ],
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: getScreenHeight(60),
      right: getScreenWidth(16),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpScreen()),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: context.colors.bgPrimaryColor,
          foregroundColor: context.colors.secondaryColor,
        ),
        child: Text(
          'Skip',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: context.colors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
