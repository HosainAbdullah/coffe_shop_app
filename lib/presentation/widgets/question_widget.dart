import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String questionText;
  final String answerText;
  final VoidCallback onTapAnswer;
  const QuestionWidget({
    super.key,
    required this.questionText,
    required this.answerText,
    required this.onTapAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(questionText, style: Theme.of(context).textTheme.headlineMedium),
        InkWell(
          highlightColor: context.colors.secondaryColor,
          borderRadius: BorderRadius.circular(getScreenWidth(5)),
          onTap: onTapAnswer,
          child: Padding(
            padding: SizeConfig.horizontalPadding(size: 8),
            child: Text(
              answerText,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: context.colors.primaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
