import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text.tr(context),
        style: Theme.of(context).textTheme.labelMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
