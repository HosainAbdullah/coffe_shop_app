import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/presentation/pages/location_screen.dart';
import 'package:coffe_shop_app/presentation/pages/search_location_screen.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/secondary_button_app.dart';
import 'package:flutter/material.dart';

// ! Done
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
              CircleBgAndIcon(icon: Icons.notifications_rounded),

              SizedBox(height: getScreenHeight(20)),

              // Main Question Text
              Text(
                "Enable Notification Access",
                style: Theme.of(
                  context,
                ).textTheme.displayLarge?.copyWith(fontSize: getFontSize(20)),
              ),

              SizedBox(height: getScreenHeight(10)),

              // Subtext for purpose
              Text(
                "Enable notification to receive real-time updates.",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: context.colors.textWeak,
                ),
              ),

              SizedBox(height: getScreenHeight(20)),

              // Button to Allow Location Access
              PrimaryButtonApp(
                text: 'Allow Notification',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchLocationScreen(),
                    ),
                  );
                },
              ),

              SizedBox(height: getScreenHeight(20)),

              // Option to Enter Location Manually
              SecondaryButtonApp(text: "Maybe Later"),
            ],
          ),
        ),
      ),
    );
  }
}
