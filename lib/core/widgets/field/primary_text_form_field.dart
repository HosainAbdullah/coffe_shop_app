import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';

class PrimaryTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;

  const PrimaryTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,

      decoration: InputDecoration(
        contentPadding: SizeConfig.horizontalPadding(),
        hintText: hintText,

        hintStyle: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: context.colors.textWeak),
        filled: true,
        fillColor: context.colors.surfaceSecondary,
        suffixIcon: suffixIcon,
      ),
      cursorHeight: getFontSize(20),
      cursorColor: context.colors.primaryColor,
      style: Theme.of(context).textTheme.titleLarge,
      keyboardType: keyboardType ?? TextInputType.name,
      textInputAction: textInputAction ?? TextInputAction.next,

      validator: validator,
    );
  }
}
