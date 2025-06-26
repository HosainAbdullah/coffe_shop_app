import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  int get currentPage => _currentPage;
  PageController get pageController => _pageController;

  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }
}
