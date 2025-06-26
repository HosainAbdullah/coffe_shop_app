import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/presentation/pages/complete_profile_screen.dart';
import 'package:coffe_shop_app/presentation/pages/otp_verification_screen.dart';
import 'package:coffe_shop_app/presentation/pages/sign_up_screen.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/presentation/widgets/field/primary_text_form_field.dart';
import 'package:coffe_shop_app/presentation/widgets/question_widget.dart';
import 'package:coffe_shop_app/presentation/widgets/social_media_button.dart';
import 'package:coffe_shop_app/presentation/widgets/sub_title_widget.dart';
import 'package:coffe_shop_app/presentation/widgets/text_sign_up_with.dart';
import 'package:coffe_shop_app/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';

// ! Done
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
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
                  SizedBox(height: getScreenHeight(30)),
                  TitleWidget(text: 'Sing In'),
                  SizedBox(height: getScreenHeight(10)),
                  SubTitleWidget(text: "Hi! Welcome back, you've been missed"),
                  SizedBox(height: getScreenHeight(30)),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle terms and conditions page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OTPVerificationScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password ?',
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(
                            color: context.colors.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getScreenHeight(20)),

                  // Sign Up Button
                  PrimaryButtonApp(
                    text: 'Sign In',
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
                  SizedBox(height: getScreenHeight(30)),
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
                  SizedBox(height: getScreenHeight(30)),
                  QuestionWidget(
                    questionText: 'Don\'t have an account ?',
                    answerText: 'Sign Up',
                    onTapAnswer: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
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
