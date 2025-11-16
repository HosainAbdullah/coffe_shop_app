import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonBackAppBar extends StatelessWidget {
  const ButtonBackAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SizeConfig.rightPadding(),
      child: IconButton(
        style: IconButton.styleFrom(
          shape: CircleBorder(),
          padding: SizeConfig.defaultPadding(size: 8),
          side: BorderSide(color: context.colors.iconDefault, width: 1),
        ),
        icon: Icon(Icons.arrow_back_ios_new_rounded, size: getFontSize(16)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headlineMedium);
  }
}
