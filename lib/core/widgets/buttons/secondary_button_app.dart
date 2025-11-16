import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SecondaryButtonApp extends StatelessWidget {
  const SecondaryButtonApp({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: context.colors.bgPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getScreenWidth(8)),
        ),
        minimumSize: Size(MediaQuery.of(context).size.width, 55),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: context.colors.primaryColor,
        ),
      ),
    );
  }
}
