import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:coffe_shop_app/features/start/data/datasources/onboarding.dart';
import 'package:coffe_shop_app/features/start/presentation/controller/onboarding_provider.dart';
import 'package:coffe_shop_app/core/widgets/image_show_welcome_and_onboarding.dart';
import 'package:coffe_shop_app/core/widgets/sub_title_in_start_screen.dart';
import 'package:coffe_shop_app/features/start/presentation/widgets/buttons_onboarding_widget.dart';
import 'package:coffe_shop_app/features/start/presentation/widgets/indicator_widget.dart';
import 'package:coffe_shop_app/features/start/presentation/widgets/skip_button.dart';
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
                return OnboardingPage(
                  imageAsset: onboarding[index].imageAsset,
                  title: onboarding[index].title,
                  subtitle: onboarding[index].subtitle,
                );
              },
            ),
          ),
          IndicatorWidget(
            currentPage: Provider.of<OnboardingProvider>(context).currentPage,
          ),
          ButtonsOnBoardingWidget(
            currentPage: Provider.of<OnboardingProvider>(context).currentPage,
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
          title.tr(context),
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
