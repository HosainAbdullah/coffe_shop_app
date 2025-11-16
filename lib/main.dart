import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/strings/strings_all_app.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/controller/language_provider.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:coffe_shop_app/features/home/presentation/controller/main_provider.dart';
import 'package:coffe_shop_app/features/start/presentation/controller/onboarding_provider.dart';
import 'package:coffe_shop_app/core/controller/theme_provider.dart';
import 'package:coffe_shop_app/features/start/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider(),
        ),
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
      // title: 'Coffe Shop App',
      title:
          Provider.of<LanguageProvider>(context).lang == 'ar'
              ? StringsAllApp.appNameAr
              : StringsAllApp.appNameEn,
      locale: Locale(Provider.of<LanguageProvider>(context).lang),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (deviceLocale != null &&
              deviceLocale.languageCode == locale.languageCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      theme:
          Provider.of<ThemeProvider>(context).isDarkMode
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      home: const WelcomeScreen(),
    );
  }
}
