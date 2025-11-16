import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => _buildTheme(
    brightness: Brightness.light,
    colors: AppColorsExtension.light,
    colorScheme: const ColorScheme.light(),
  );

  static ThemeData get darkTheme => _buildTheme(
    brightness: Brightness.dark,
    colors: AppColorsExtension.dark,
    colorScheme: const ColorScheme.dark(),
  );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required AppColorsExtension colors,
    required ColorScheme colorScheme,
  }) {
    final fontFamily = 'NotoSansArabic';

    return ThemeData(
      fontFamily: fontFamily,
      useMaterial3: true,
      brightness: brightness,
      splashFactory: NoSplash.splashFactory,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.background,
      dividerTheme: DividerThemeData(
        color: colors.borderDefault,
        space: 0,
        thickness: 1,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        surfaceTintColor: colors.background,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: getFontSize(15),
          fontWeight: FontWeight.w400,
          color: colors.textDefault,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            // color: Colors.red,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(
            SizeConfig.defaultRadius(size: 10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: colors.primaryColor),
          borderRadius: BorderRadius.circular(
            SizeConfig.defaultRadius(size: 10),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: colors.errorColor),
          borderRadius: BorderRadius.circular(
            SizeConfig.defaultRadius(size: 10),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: colors.errorColor),
          borderRadius: BorderRadius.circular(
            SizeConfig.defaultRadius(size: 10),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            colors.background.withAlpha(30),
          ),
          foregroundColor: WidgetStateProperty.all<Color>(colors.primaryColor),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                SizeConfig.defaultRadius(size: 13),
              ),
            ),
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            SizeConfig.defaultPadding(size: 10),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.surface,
        selectedItemColor: colors.primaryColor,
        unselectedItemColor: colors.iconDefault,
        selectedLabelStyle: TextStyle(
          color: colors.primaryColor,
          fontSize: getFontSize(10),
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          color: colors.iconDefault,
          fontSize: getFontSize(10),
          fontWeight: FontWeight.w500,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 5,
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: Colors.amber,
        modalBarrierColor: AppColors.darkScrim,
      ),

      textTheme: _buildTextTheme(colors.textDefault),
      // color: AppColors.lightTextDefault,
      extensions: <ThemeExtension>[colors],
    );
  }

  static TextTheme _buildTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: getFontSize(18),
        fontWeight: FontWeight.bold,
        color: textColor,
        // fontFamily: "NotoSansArabic",
      ),
      displayMedium: TextStyle(
        fontSize: getFontSize(18),
        fontWeight: FontWeight.w500,
        color: textColor,
        // fontFamily: "NotoSansArabic",
      ),
      displaySmall: TextStyle(
        fontSize: getFontSize(18),
        fontWeight: FontWeight.w100,
        color: textColor,
      ),

      headlineLarge: TextStyle(
        fontSize: getFontSize(16),
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontSize: getFontSize(16),
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontSize: getFontSize(16),
        fontWeight: FontWeight.w100,
        color: textColor,
      ),

      titleLarge: TextStyle(
        fontSize: getFontSize(14),
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontSize: getFontSize(14),
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontSize: getFontSize(14),
        fontWeight: FontWeight.w100,
        color: textColor,
      ),

      labelLarge: TextStyle(
        fontSize: getFontSize(12),
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      labelMedium: TextStyle(
        fontSize: getFontSize(12),
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      labelSmall: TextStyle(
        fontSize: getFontSize(12),
        fontWeight: FontWeight.w100,
        color: textColor,
      ),

      bodyLarge: TextStyle(
        fontSize: getFontSize(10),
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontSize: getFontSize(10),
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      bodySmall: TextStyle(
        fontSize: getFontSize(10),
        fontWeight: FontWeight.w100,
        color: textColor,
      ),
    );
  }
}

extension AppThemeX on BuildContext {
  AppColorsExtension get colors =>
      Theme.of(this).extension<AppColorsExtension>()!;
}
