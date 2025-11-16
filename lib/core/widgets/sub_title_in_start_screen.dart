import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:flutter/material.dart';

class SubTitleInStartScreen extends StatelessWidget {
  final String text;
  const SubTitleInStartScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SizeConfig.horizontalPadding(),
      child: Text(
        text.tr(context),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: context.colors.textWeak,
          // fontFamily: "NotoSansArabic",
        ),
      ),
    );
  }
}
