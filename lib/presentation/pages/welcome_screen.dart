import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/presentation/pages/onboarding_screen.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/presentation/widgets/image_show_welcome_and_onboarding.dart';
import 'package:coffe_shop_app/presentation/widgets/padding_horizontal.dart';
import 'package:coffe_shop_app/presentation/widgets/question_widget.dart';
import 'package:coffe_shop_app/presentation/widgets/sub_title_in_start_screen.dart';
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
              imageUrl: 'assets/images/welcome.png',
              height: sizeHeight * 0.6,
            ),
            SizedBox(height: getScreenHeight(32)),
            TitleSectionInWelcome(),
            SizedBox(height: getScreenHeight(16)),
            SubTitleInStartScreen(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
            ),
            SizedBox(height: getScreenHeight(32)),
            PaddingHorizontal(
              child: PrimaryButtonApp(
                text: 'Let\'s Get Started',
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
              questionText: 'Already have an account ?',
              answerText: 'Sign In',
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
          style: Theme.of(
            context,
          ).textTheme.displayLarge?.copyWith(fontSize: getFontSize(24)),
          children: [
            TextSpan(text: 'Step into Our '),
            TextSpan(
              text: 'World of Coffee ',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: getFontSize(24),
                color: context.colors.primaryColor,
              ),
            ),
            TextSpan(text: 'Delight!'),
          ],
        ),
      ),
    );
  }
}
