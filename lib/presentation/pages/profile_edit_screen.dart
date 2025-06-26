import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/presentation/pages/profile_screen.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/button_back_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  String? _selectedGender;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Your Profile',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: ButtonBackAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Header section
            ProfileHeader(
              imageUrl:
                  'https://images.pexels.com/photos/15221973/pexels-photo-15221973.jpeg',
              name: 'Esther Howard',
              onEditPressed: () {
                // Logic to navigate to edit profile screen
              },
            ),

            // Name field
            Text('Name', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 5),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: 'Esther Howard',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
                // border: InputBorder.none,
                filled: true,
                // fillColor: Color(0x3D797979),
                fillColor: Color(0x37BAB7B7),
              ),
              cursorHeight: 25,
              cursorColor: Color(0xFF0C544C),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 16),

            // Phone Number field
            Text(
              'Phone Number',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 45,
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      hintText: '603.555.0123',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                      // border: InputBorder.none,
                      filled: true,
                      // fillColor: Color(0x3D797979),
                      fillColor: Color(0x37BAB7B7),

                      suffix: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Change",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: context.colors.primaryColor),
                        ),
                      ),
                    ),
                    cursorHeight: 25,
                    cursorColor: Color(0xFF0C544C),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
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
            SizedBox(height: 16),

            // Email field
            Text('Email', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: 'example@gmail.com',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
                // border: InputBorder.none,
                filled: true,
                // fillColor: Color(0x3D797979),
                fillColor: Color(0x37BAB7B7),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,

              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedGender,

              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                hintText: 'Select',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey[500]),
                // border: InputBorder.none,
                filled: true,
                // fillColor: Color(0x3D797979),
                fillColor: Color(0x37BAB7B7),
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
          ],
        ),
      ),
      bottomSheet: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.colors.background,
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeConfig.defaultRadius()),
            topRight: Radius.circular(SizeConfig.defaultRadius()),
          ),
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.5)],
        ),
        child: Padding(
          padding: SizeConfig.defaultPadding(size: 16),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle button press (e.g., navigate to the next screen)
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.primaryColor,
                  foregroundColor: context.colors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: Size(MediaQuery.of(context).size.width, 55),
                ),
                child: Text(
                  'Update',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: context.colors.background,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final String value;
  final bool readOnly;
  final String? suffixText;
  final VoidCallback? suffixOnTap;

  const InputField({
    super.key,
    required this.label,
    required this.value,
    this.readOnly = false,
    this.suffixText,
    this.suffixOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14)),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text(value),
            trailing:
                suffixText != null
                    ? GestureDetector(
                      onTap: suffixOnTap,
                      child: Text(
                        suffixText!,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )
                    : null,
            enabled: !readOnly,
          ),
        ),
      ],
    );
  }
}

// class DropdownField<T> extends StatelessWidget {
//   final String label;
//   final List<T> items;
//   final void Function<T>? onChanged;

//   const DropdownField({
//     super.key,
//     required this.label,
//     required this.items,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: TextStyle(fontSize: 14)),
//         SizedBox(height: 8),
//         DropdownButtonFormField<String>(
//           decoration: InputDecoration(
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//           ),
//           items:
//               items.map((String item) {
//                 return DropdownMenuItem<String>(value: item, child: Text(item));
//               }).toList(),
//           onChanged: onChanged,
//         ),
//       ],
//     );
//   }
// }
