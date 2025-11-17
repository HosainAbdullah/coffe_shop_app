import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.iconName,
    required this.onPressed,
  });

  final String iconName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: SizeConfig.defaultPadding(size: 15),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.5, color: context.colors.iconDefault),
          borderRadius: BorderRadius.circular(
            SizeConfig.defaultRadius(size: 24),
          ),
        ),
        maximumSize: Size(getScreenWidth(60), getScreenHeight(60)),
        minimumSize: Size(getScreenWidth(30), getScreenHeight(30)),
      ),
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconName,
        width: getScreenWidth(20),
        height: getScreenHeight(20),
      ),
    );
  }
}
