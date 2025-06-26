import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/presentation/pages/location_screen.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/presentation/widgets/field/primary_text_form_field.dart';
import 'package:coffe_shop_app/presentation/widgets/sub_title_widget.dart';
import 'package:coffe_shop_app/presentation/widgets/title_widget.dart';
import 'package:flutter/material.dart';

// ! Done
class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  CompleteProfileScreenState createState() => CompleteProfileScreenState();
}

class CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String? _selectedGender;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
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
                TitleWidget(text: 'Complete Your Profile'),
                SizedBox(height: getScreenHeight(10)),
                SubTitleWidget(
                  text:
                      "Don't worry, only you can see your personal data. No one else will be able to see it.",
                ),
                SizedBox(height: getScreenHeight(24)),

                // Profile Image
                Center(child: ProfileImageWidget()),

                SizedBox(height: getScreenHeight(24)),

                // Name Field
                Text('Name', style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: getScreenHeight(5)),
                PrimaryTextFormField(
                  controller: _nameController,
                  hintText: 'Ex. John Doe',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: getScreenHeight(16)),

                // Phone Number Field
                Text(
                  'Phone Number',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: getScreenHeight(5)),
                Row(
                  children: [
                    Container(
                      width: getScreenWidth(80),
                      height: getScreenHeight(45),
                      decoration: BoxDecoration(
                        color: context.colors.surfaceSecondary,
                        borderRadius: BorderRadius.circular(
                          SizeConfig.defaultRadius(size: 8),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          padding: SizeConfig.horizontalPadding(size: 12),
                          value: '+1',
                          items: [
                            DropdownMenuItem(value: '+1', child: Text('+1')),
                            DropdownMenuItem(value: '+44', child: Text('+44')),
                            DropdownMenuItem(value: '+91', child: Text('+91')),
                          ],
                          onChanged: (newValue) {},
                        ),
                      ),
                    ),
                    SizedBox(width: getScreenWidth(8)),
                    Expanded(
                      child: PrimaryTextFormField(
                        controller: _phoneNumberController,
                        hintText: 'Enter Phone Number',
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getScreenHeight(16)),

                // Gender Field
                Text('Gender', style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: getScreenHeight(5)),
                DropdownButtonFormField<String>(
                  value: _selectedGender,

                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    hintText: 'Select',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                        SizeConfig.defaultRadius(size: 10),
                      ),
                    ),
                    hintStyle: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(color: context.colors.textWeak),
                    filled: true,
                    fillColor: context.colors.surfaceSecondary,
                  ),
                  items: [
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                    DropdownMenuItem(value: 'Other', child: Text('Other')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),

                SizedBox(height: getScreenHeight(24)),

                // Complete Profile Button
                PrimaryButtonApp(
                  text: 'Complete Profile',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getScreenHeight(120),
          width: getScreenWidth(120),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: context.colors.surfaceSecondary,
            shape: BoxShape.circle, // شكل دائري
          ),
          child: Icon(
            Icons.person,
            size: getFontSize(60),
            color: context.colors.primaryColor,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: getScreenWidth(30),
            height: getScreenHeight(30),
            decoration: BoxDecoration(
              color: context.colors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.edit,
              size: getFontSize(20),
              color: context.colors.background,
            ),
          ),
        ),
      ],
    );
  }
}
