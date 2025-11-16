import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/strings/strings_all_app.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:coffe_shop_app/features/auth/presentation/screens/new_password.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/sub_title_widget.dart';
import 'package:coffe_shop_app/core/widgets/title_widget.dart';
import 'package:flutter/material.dart';

// ! Done
class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  OTPVerificationScreenState createState() => OTPVerificationScreenState();
}

class OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  void _handleInput(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
      }
    } else if (value.isEmpty) {
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      } else {
        FocusScope.of(context).unfocus();
      }
    }
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: ButtonBackAppBar()),
      body: Padding(
        padding: SizeConfig.defaultPadding(),
        child: Column(
          children: [
            SizedBox(height: getScreenHeight(30)),
            TitleWidget(text: StringsAllApp.verifyCodeText),
            SizedBox(height: getScreenHeight(10)),
            SubTitleWidget(text: StringsAllApp.enterTheCodeSentText),
            Text(
              'example@email.com',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: context.colors.primaryColor,
              ),
            ),
            SizedBox(height: getScreenHeight(30)),

            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: getScreenWidth(15),
              children: List.generate(
                4,
                (index) => OTPInputField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  onSubmitted: (value) => _handleInput(value, index),
                ),
              ),
            ),

            SizedBox(height: getScreenHeight(24)),

            // Resend Code Link
            Text(
              StringsAllApp.didntReceiveOTPText.tr(context),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: getScreenHeight(10)),
            GestureDetector(
              onTap: () {},
              child: Text(
                StringsAllApp.resendCodeText.tr(context),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: context.colors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            SizedBox(height: getScreenHeight(30)),

            // Verify Button
            PrimaryButtonApp(
              text: StringsAllApp.verifyText.tr(context),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPasswordScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OTPInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSubmitted;

  const OTPInputField({
    super.key,
    required this.controller,
    this.focusNode,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(55),
      height: getScreenHeight(50),
      decoration: BoxDecoration(
        color: context.colors.surfaceSecondary,
        borderRadius: BorderRadius.circular(SizeConfig.defaultRadius(size: 10)),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        cursorHeight: getScreenHeight(25),
        cursorColor: context.colors.primaryColor,
        style: Theme.of(
          context,
        ).textTheme.displayLarge?.copyWith(fontSize: getFontSize(24)),
        decoration: InputDecoration(border: InputBorder.none, counterText: ''),
        onChanged: (value) {
          onSubmitted?.call(value);
        },
      ),
    );
  }
}
