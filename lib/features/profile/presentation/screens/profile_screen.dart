import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/features/profile/presentation/screens/profile_edit_screen.dart';
import 'package:coffe_shop_app/presentation/pages/coupon_screen.dart';
import 'package:coffe_shop_app/presentation/pages/wallet_screen.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/custem_cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile', style: Theme.of(context).textTheme.titleMedium),
        leading: ButtonBackAppBar(),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
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

          // Settings items
          SettingsItem(
            icon: Icons.person,
            title: 'Your profile',
            onTap: () {
              // Navigate to profile details

              // ProfileEditScreen

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileEditScreen()),
              );
            },
          ),
          SettingsItem(
            icon: Icons.location_on,
            title: 'Manage Address',
            onTap: () {
              // Navigate to address management
            },
          ),
          SettingsItem(
            icon: Icons.local_drink,
            title: 'Coffee\'s Point',
            onTap: () {
              // Navigate to coffee points
            },
          ),
          SettingsItem(
            icon: Icons.payment,
            title: 'Payment Methods',
            onTap: () {
              // Navigate to payment methods
            },
          ),
          SettingsItem(
            icon: Icons.receipt,
            title: 'My Orders',
            onTap: () {
              // Navigate to orders
            },
          ),
          SettingsItem(
            icon: Icons.card_giftcard,
            title: 'My Coupons',
            onTap: () {
              // Navigate to coupons
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CouponScreen()),
              );
            },
          ),
          SettingsItem(
            icon: Icons.wallet,
            title: 'My Wallet',
            onTap: () {
              // Navigate to wallet
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WalletScreen()),
              );
            },
          ),
          SettingsItem(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              // Navigate to settings
            },
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String imageUrl;
  final String name;
  final VoidCallback onEditPressed;

  const ProfileHeader({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: getScreenHeight(100),
              width: getScreenWidth(100),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // شكل دائري
                // border: Border.all(
                //   color: context.colors.secondaryColor, // لون الحدود
                //   width: 1.0, // عرض الحدود
                //   strokeAlign: BorderSide.strokeAlignOutside,
                // ),
              ),
              child: CustemCachedNetworkImage(
                imagePath: imageUrl,
                sizeImage: SizeImage.small,
              ),
            ),
            SizedBox(width: 8),
            Positioned(
              bottom: -8,
              right: -8,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: context.colors.primaryColor,
                  padding: EdgeInsets.zero,
                  minimumSize: Size(30, 30),
                  side: BorderSide(
                    color: context.colors.background,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
                icon: Icon(
                  Icons.edit_note_rounded,
                  color: context.colors.background,
                  size: 20,
                ),
                onPressed: onEditPressed,
                tooltip: 'Edit Profile',
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: context.colors.primaryColor,
            size: getFontSize(30),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: context.colors.primaryColor,
          ),
          onTap: onTap,
        ),
        Divider(),
      ],
    );
  }
}
