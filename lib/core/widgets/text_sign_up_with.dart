import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/strings/strings_all_app.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:flutter/material.dart';

class TextSignUpWith extends StatelessWidget {
  const TextSignUpWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: getScreenWidth(80),
          child: Divider(
            color: context.colors.primaryColor,
            height: getScreenHeight(3),
          ),
        ),
        SizedBox(width: getScreenWidth(10)),
        Text(
          StringsAllApp.orSignUpWithText.tr(context),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(width: getScreenWidth(10)),
        SizedBox(
          width: getScreenWidth(80),
          child: Divider(
            color: context.colors.primaryColor,
            height: getScreenHeight(3),
          ),
        ),
      ],
    );
  }
}
