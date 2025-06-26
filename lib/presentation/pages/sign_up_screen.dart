import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/presentation/pages/complete_profile_screen.dart';
import 'package:coffe_shop_app/presentation/pages/login_screen.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/presentation/widgets/field/primary_text_form_field.dart';
import 'package:coffe_shop_app/presentation/widgets/question_widget.dart';
import 'package:coffe_shop_app/presentation/widgets/social_media_button.dart';
import 'package:coffe_shop_app/presentation/widgets/sub_title_widget.dart';
import 'package:coffe_shop_app/presentation/widgets/text_sign_up_with.dart';
import 'package:coffe_shop_app/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';

// ! Done
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isTermsAccepted = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _onTermsChanged(bool? value) {
    setState(() {
      _isTermsAccepted = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: SizeConfig.defaultPadding(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getScreenHeight(20)),
                  TitleWidget(text: 'Create Account'),
                  SizedBox(height: getScreenHeight(10)),
                  SubTitleWidget(
                    text:
                        "Fill your information below or register with your social account.",
                  ),
                  SizedBox(height: getScreenHeight(20)),

                  // Name Field
                  Text('Name', style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(height: getScreenHeight(5)),
                  PrimaryTextFormField(
                    hintText: 'Ex. John Doe',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: getScreenHeight(16)),

                  // Email Field
                  Text('Email', style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(height: getScreenHeight(5)),
                  PrimaryTextFormField(
                    hintText: 'example@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: getScreenHeight(16)),

                  // Password Field
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: getScreenHeight(5)),
                  PrimaryTextFormField(
                    hintText: '************',
                    obscureText: !_isPasswordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Please enter a password with at least 6 characters';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),

                  SizedBox(height: getScreenHeight(16)),

                  // Terms & Conditions Checkbox
                  CheckboxWidget(
                    value: _isTermsAccepted,
                    onChanged: _onTermsChanged,
                    text: 'Agree with ',
                    widget: GestureDetector(
                      onTap: () {
                        // Handle terms and conditions page
                      },
                      child: Text(
                        'Terms & Condition',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: context.colors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  // Sign Up Button
                  PrimaryButtonApp(
                    text: 'Sign Up',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompleteProfileScreen(),
                        ),
                      );
                    },
                  ),

                  // Social Login Options
                  SizedBox(height: getScreenHeight(24)),
                  TextSignUpWith(),
                  SizedBox(height: getScreenHeight(16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaButton(icon: Icons.apple, onTap: () {}),
                      SizedBox(width: getScreenWidth(16)),
                      SocialMediaButton(icon: Icons.g_mobiledata, onTap: () {}),
                      SizedBox(width: getScreenWidth(16)),
                      SocialMediaButton(icon: Icons.facebook, onTap: () {}),
                    ],
                  ),

                  // Already have an account link
                  SizedBox(height: getScreenHeight(24)),
                  QuestionWidget(
                    questionText: 'Already have an account ?',
                    answerText: 'Sign In',
                    onTapAnswer: () {
                      // LoginScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                      // Handle sign-in action
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckboxWidget extends StatelessWidget {
  final bool? value;
  final void Function(bool?)? onChanged;
  final String text;
  final Widget? widget;
  const CheckboxWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor: WidgetStateProperty.resolveWith<Color>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.selected)) {
              return context.colors.primaryColor;
            }
            return context.colors.bgPrimaryColor;
          }),
          value: value,
          onChanged: onChanged,
        ),
        Text(text, style: Theme.of(context).textTheme.labelLarge),
        if (widget != null) widget!,
      ],
    );
  }
}
