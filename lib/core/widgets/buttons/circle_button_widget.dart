import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CircleButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? color;
  final Color? colorBorder;
  final Color? backgroundColor;
  final double? sizeIcon;
  final double? sizePadding;

  const CircleButtonWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.colorBorder,
    this.backgroundColor,
    this.sizeIcon,
    this.sizePadding,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor ?? context.colors.background,
        shape: CircleBorder(),
        padding: SizeConfig.defaultPadding(size: sizePadding ?? 8),
        side: BorderSide(
          color: colorBorder ?? context.colors.textWeak,
          width: getScreenWidth(2),
        ),
      ),

      icon: Icon(
        icon,
        size: getFontSize(sizeIcon ?? 20),
        color: color ?? context.colors.textWeak,
      ),
      onPressed: onPressed,
    );
  }
}
