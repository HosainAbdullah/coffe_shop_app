import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RatingBarWidget extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const RatingBarWidget({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        SizedBox(width: getScreenWidth(8)),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              SizeConfig.defaultRadius(size: 4),
            ),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: context.colors.shadowColor,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: getFontSize(6),
            ),
          ),
        ),
      ],
    );
  }
}
