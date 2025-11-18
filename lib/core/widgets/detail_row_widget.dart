import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:flutter/material.dart';

class DetailRowWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const DetailRowWidget({
    super.key,
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SizeConfig.verticalPadding(size: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
