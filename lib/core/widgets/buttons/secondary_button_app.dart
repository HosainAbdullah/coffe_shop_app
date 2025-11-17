import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SecondaryButtonApp extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? child;
  const SecondaryButtonApp({
    super.key,
    required this.text,
    required this.onPressed,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.primaryColor.withAlpha(30),
        foregroundColor: context.colors.bgPrimaryColor,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getScreenWidth(8)),
        ),
        minimumSize: Size(MediaQuery.of(context).size.width, 55),
      ),
      child:
          child ??
          Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: context.colors.primaryColor,
            ),
          ),
    );
  }
}
