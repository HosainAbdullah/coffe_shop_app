import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(SizeConfig.defaultRadius(size: 24)),
      highlightColor: context.colors.secondaryColor,
      child: CircleAvatar(
        radius: getScreenWidth(24),
        backgroundColor: context.colors.bgPrimaryColor,
        child: Icon(
          icon,
          size: getFontSize(30),
          color: context.colors.primaryColor,
        ),
      ),
    );
  }
}
