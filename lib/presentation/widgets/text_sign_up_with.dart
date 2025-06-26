import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
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
        Text('Or sign up with', style: Theme.of(context).textTheme.bodyMedium),
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
