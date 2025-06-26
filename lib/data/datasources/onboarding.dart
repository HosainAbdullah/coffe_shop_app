import 'package:coffe_shop_app/presentation/pages/onboarding_screen.dart';
import 'package:flutter/material.dart';

final List<Widget> onboarding = [
  OnboardingPage(
    title: 'Wishlist Your Coffee',
    subtitle:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
    imageAsset:
        'assets/images/on-boarding-1.jpeg', // Replace with your image path
  ),
  OnboardingPage(
    title: 'Explore New Flavors',
    subtitle:
        'Discover a variety of coffee flavors and create your perfect cup.',
    imageAsset:
        'assets/images/on-boarding-2.jpg', // Replace with your image path
  ),
  OnboardingPage(
    title: 'Order Easily',
    subtitle: 'Place orders effortlessly with our user-friendly interface.',
    imageAsset:
        'assets/images/on-boarding-3.jpg', // Replace with your image path
  ),
];
