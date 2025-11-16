import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/strings/strings_all_app.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/field/primary_text_form_field.dart';
import 'package:coffe_shop_app/core/widgets/sub_title_widget.dart';
import 'package:coffe_shop_app/core/widgets/title_widget.dart';
import 'package:flutter/material.dart';

// ! Done
class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission (e.g., API call)
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: ButtonBackAppBar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: SizeConfig.defaultPadding(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(text: StringsAllApp.newPasswordText),
                SizedBox(height: getScreenHeight(10)),
                SubTitleWidget(text: StringsAllApp.newPasswordTitleText),

                SizedBox(height: getScreenHeight(24)),

                // Password Field
                Text(
                  StringsAllApp.passwordText.tr(context),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: getScreenHeight(5)),
                PrimaryTextFormField(
                  controller: _passwordController,
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

                // Password Field
                Text(
                  StringsAllApp.confirmPasswordText.tr(context),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: getScreenHeight(5)),
                PrimaryTextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  hintText: '************',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'Please enter a confirm password with at least 6 characters';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: _toggleConfirmPasswordVisibility,
                  ),
                ),
                SizedBox(height: getScreenHeight(30)),

                PrimaryButtonApp(
                  text: StringsAllApp.createNewPasswordText.tr(context),
                  onPressed: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
