import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/presentation/controller/main_provider.dart';
import 'package:coffe_shop_app/presentation/controller/onboarding_provider.dart';
import 'package:coffe_shop_app/presentation/controller/theme_provider.dart';
import 'package:coffe_shop_app/presentation/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle.dark.copyWith(
  //     statusBarColor: Colors.white, // Color for Android
  //     statusBarBrightness:
  //         Brightness.dark, // Dark == white status bar -- for IOS.
  //   ),
  // );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<MainProvider>(create: (_) => MainProvider()),
        ChangeNotifierProvider<OnboardingProvider>(
          create: (_) => OnboardingProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context: context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffe Shop App',
      theme:
          Provider.of<ThemeProvider>(context).isDarkMode
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      // home: const IntroductionScreen(),
      // home: const HomePage(),
      home: const WelcomeScreen(),
    );
  }
}
