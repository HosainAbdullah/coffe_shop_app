import 'package:coffe_shop_app/presentation/controller/main_provider.dart';
import 'package:coffe_shop_app/presentation/pages/home_screen.dart';
import 'package:coffe_shop_app/presentation/pages/profile_screen.dart';
import 'package:coffe_shop_app/presentation/pages/wishlist_screen.dart';
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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
