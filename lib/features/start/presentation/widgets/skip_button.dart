import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/strings/strings_all_app.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:coffe_shop_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

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
          backgroundColor: context.colors.background,
          foregroundColor: context.colors.secondaryColor,
        ),
        child: Text(
          StringsAllApp.skipText.tr(context),
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: context.colors.primaryColor),
        ),
      ),
    );
  }
}
