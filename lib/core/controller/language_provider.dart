import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  String _langType = 'ar';

  String get lang => _langType;

  Future<void> changeLanguage(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCALE", languageCode);
    _langType = languageCode;
    notifyListeners();
  }

  void getSavedLanguage() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString("LOCALE");
    if (cachedLanguageCode != null) {
      _langType = cachedLanguageCode;
      notifyListeners();
    } else {
      final String deviceLanguage = Platform.localeName;
      final String languageCode = deviceLanguage.substring(0, 2);
      _langType = languageCode;
      notifyListeners();
    }
  }
}
