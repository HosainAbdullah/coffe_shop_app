import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PrimaryButtonApp extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final Widget? child;
  const PrimaryButtonApp({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.primaryColor,
        foregroundColor: context.colors.secondaryColor,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeConfig.defaultRadius(size: 8),
          ),
        ),
        minimumSize: Size(
          getScreenWidth(width ?? MediaQuery.of(context).size.width),
          getScreenHeight(height ?? 55),
        ),
      ),
      child:
          child ??
          Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: context.colors.background,
            ),
          ),
    );
  }
}
