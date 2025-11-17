import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BottomBackGroundWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  const BottomBackGroundWidget({super.key, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? getScreenHeight(90),
      decoration: BoxDecoration(
        color: context.colors.background,
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.defaultRadius()),
          topRight: Radius.circular(SizeConfig.defaultRadius()),
        ),
        boxShadow: [
          BoxShadow(color: context.colors.shadowColor, blurRadius: 1.5),
        ],
      ),
      child: Padding(padding: SizeConfig.defaultPadding(), child: child),
    );
  }
}
