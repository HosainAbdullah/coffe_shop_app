import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:flutter/material.dart';

class PaddingHorizontal extends StatelessWidget {
  const PaddingHorizontal({super.key, this.size, required this.child});
  final double? size;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (size != null) {
      return Padding(
        padding: SizeConfig.horizontalPadding(size: size!),

        child: child,
      );
    } else {
      return Padding(padding: SizeConfig.horizontalPadding(), child: child);
    }
  }
}
