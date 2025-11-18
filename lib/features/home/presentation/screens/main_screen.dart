import 'package:coffe_shop_app/constants/strings/strings_all_app.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:coffe_shop_app/features/home/presentation/controller/main_provider.dart';
import 'package:coffe_shop_app/features/home/presentation/screens/home_screen.dart';
import 'package:coffe_shop_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:coffe_shop_app/features/settings/presentation/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = Provider.of<MainProvider>(context).selectedIndex;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: Provider.of<MainProvider>(context).onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: StringsAllApp.homeText.tr(context),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: StringsAllApp.discoverText.tr(context),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: StringsAllApp.wishlistText.tr(context),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: StringsAllApp.chatText.tr(context),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: StringsAllApp.profileText.tr(context),
          ),
        ],
      ),
      body:
          selectedIndex == 0
              ? const HomeScreen()
              : selectedIndex == 1
              ? const Scaffold(body: Center(child: Text("Discover")))
              : selectedIndex == 2
              ? const WishlistScreen()
              : selectedIndex == 3
              ? const Scaffold(body: Center(child: Text("Chat")))
              : const ProfileScreen(),
    );
  }

  // Helper function to build reward circles
}
