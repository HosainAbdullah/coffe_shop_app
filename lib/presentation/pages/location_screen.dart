import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/presentation/pages/notifications_screen.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/secondary_button_app.dart';
import 'package:flutter/material.dart';

// ! Done
class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: SizeConfig.defaultPadding(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circle with Location Icon
              CircleBgAndIcon(icon: Icons.location_on),

              SizedBox(height: getScreenHeight(20)),

              // Main Question Text
              Text(
                "What is Your Location?",
                style: Theme.of(
                  context,
                ).textTheme.displayLarge?.copyWith(fontSize: getFontSize(20)),
              ),

              SizedBox(height: getScreenHeight(10)),

              // Subtext for purpose
              Text(
                "To Find Nearby Cafés.",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: context.colors.textWeak,
                ),
              ),

              SizedBox(height: getScreenHeight(20)),

              // Button to Allow Location Access
              PrimaryButtonApp(
                text: 'Allow Location Access',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsScreen(),
                    ),
                  );
                },
              ),

              SizedBox(height: getScreenHeight(20)),

              // Option to Enter Location Manually
              SecondaryButtonApp(text: "Enter Location Manually"),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleBgAndIcon extends StatelessWidget {
  const CircleBgAndIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(100),
      height: getScreenHeight(100),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.surfaceSecondary,
      ),
      child: Center(
        child: Icon(
          icon,
          size: getFontSize(40),
          color: context.colors.primaryColor, // Teal color
        ),
      ),
    );
  }
}
