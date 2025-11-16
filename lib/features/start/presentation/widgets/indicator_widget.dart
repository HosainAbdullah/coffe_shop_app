import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/features/start/data/datasources/onboarding.dart';
import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  final int currentPage;
  const IndicatorWidget({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboarding.length,
        (index) => Container(
          width: currentPage == index ? getScreenWidth(12) : getScreenWidth(8),
          height:
              currentPage == index ? getScreenHeight(12) : getScreenHeight(8),
          margin: SizeConfig.horizontalPadding(size: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                currentPage == index
                    ? context.colors.primaryColor
                    : context.colors.textWeak,
          ),
        ),
      ),
    );
  }
}
