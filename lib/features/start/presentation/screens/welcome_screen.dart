import 'package:coffe_shop_app/constants/path_const/assets_list.dart';
import 'package:coffe_shop_app/constants/path_const/local_path.dart';
import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/strings/strings_all_app.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:coffe_shop_app/features/start/presentation/screens/onboarding_screen.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/image_show_welcome_and_onboarding.dart';
import 'package:coffe_shop_app/core/widgets/padding_horizontal.dart';
import 'package:coffe_shop_app/core/widgets/question_widget.dart';
import 'package:coffe_shop_app/core/widgets/sub_title_in_start_screen.dart';
import 'package:flutter/material.dart';

// ! Done
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageShowWelcomeAndOnBoarding(
              imageUrl: AssetsPath.assetsImages + AssetsListName.images[0],
              height: sizeHeight * 0.6,
            ),
            SizedBox(height: getScreenHeight(32)),
            TitleSectionInWelcome(),
            SizedBox(height: getScreenHeight(16)),
            SubTitleInStartScreen(text: StringsAllApp.randomText),
            SizedBox(height: getScreenHeight(32)),
            PaddingHorizontal(
              child: PrimaryButtonApp(
                text: StringsAllApp.letsGetStartedText.tr(context),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  );
                },
              ),
            ),
            SizedBox(height: getScreenHeight(16)),
            QuestionWidget(
              questionText: StringsAllApp.alreadyHaveAccountText.tr(context),
              answerText: StringsAllApp.signInText.tr(context),
              onTapAnswer: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class TitleSectionInWelcome extends StatelessWidget {
  const TitleSectionInWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SizeConfig.horizontalPadding(),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: getFontSize(24),
            // fontFamily: "NotoSansArabic",
          ),
          children: [
            TextSpan(text: StringsAllApp.stepIntoOurText.tr(context)),
            TextSpan(
              text: StringsAllApp.worldOfCoffeeText.tr(context),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: getFontSize(24),
                color: context.colors.primaryColor,
                // fontFamily: "NotoSansArabic",
              ),
            ),
            TextSpan(text: StringsAllApp.delightText.tr(context)),
          ],
        ),
      ),
    );
  }
}
