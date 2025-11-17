import 'package:coffe_shop_app/constants/path_const/assets_list.dart';
import 'package:coffe_shop_app/constants/path_const/local_path.dart';
import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/strings/strings_all_app.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:coffe_shop_app/features/auth/presentation/screens/complete_profile_screen.dart';
import 'package:coffe_shop_app/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:coffe_shop_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/field/primary_text_form_field.dart';
import 'package:coffe_shop_app/core/widgets/question_widget.dart';
import 'package:coffe_shop_app/core/widgets/social_media_button.dart';
import 'package:coffe_shop_app/core/widgets/sub_title_widget.dart';
import 'package:coffe_shop_app/core/widgets/text_sign_up_with.dart';
import 'package:coffe_shop_app/core/widgets/title_widget.dart';
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
                  TitleWidget(text: StringsAllApp.signInText),
                  SizedBox(height: getScreenHeight(10)),
                  SubTitleWidget(text: StringsAllApp.titleSingInText),
                  SizedBox(height: getScreenHeight(30)),
                  // Email Field
                  Text(
                    StringsAllApp.emailText.tr(context),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
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
                    StringsAllApp.passwordText.tr(context),
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
                          StringsAllApp.forgotPasswordText.tr(context),
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
                    text: StringsAllApp.signInText.tr(context),
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
                      SocialMediaButton(
                        iconName:
                            AssetsPath.assetsIcons + AssetsListName.icons[0],
                        onPressed: () {},
                      ),
                      SizedBox(width: getScreenWidth(10)),
                      SocialMediaButton(
                        iconName:
                            AssetsPath.assetsIcons + AssetsListName.icons[1],
                        onPressed: () {},
                      ),
                    ],
                  ),

                  // Already have an account link
                  SizedBox(height: getScreenHeight(30)),
                  QuestionWidget(
                    questionText: StringsAllApp.dontHaveAccountText.tr(context),
                    answerText: StringsAllApp.createAccountText.tr(context),
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
