import 'package:flutter/material.dart';

abstract class AppColors {
  // اللون الرئيسي في التطبيق
  static const primaryColor = Color(0xFF007E6E);
  static const backgroundPrimaryColor = Color(0x30007E6E);

  static const successColor = Color(0xFF0EBE7F);
  static const backgroundSuccessColor = Color(0x300EBE7F);

  static const errorColor = Color(0xFFDC3545);
  static const backgroundErrorColor = Color(0x30DC3545);
  static const secondaryColor = Color(0xFFF1C67C);

  static const yellowColor = Color(0xFFFEC624);

  static const blackColor = Color(0xFF242424);
  static const grayColor = Color(0xFF797979);
  static const whiteColor = Color(0xFFf6f6f6);

  // لون خلفية عامة للتطبيق
  static const lightBackground = Color(0xFFFFFFFF);

  // لون لأسطح العناصر مثل البطاقات (Cards) أو الحاويات (Containers).
  static const lightSurface = Color(0xFFFFFFFF);

  // لون ثانوي لأسطح العناصر، مثل الخلفيات الثانوية أو الأجزاء غير الرئيسية
  static const lightSurfaceSecondary = Color(0xFFF5F5F5);

  // الاستخدام: يستخدم كلون طبقة تغطية (Overlay) فوق العناصر، مثل ظهور مربع حوار (Dialog) أو قائمة (Menu).
  static const lightScrim = Color(0x4C000000);

  // يستخدم كلون افتراضي للنصوص الرئيسية
  static const lightTextDefault = Color(0xFF222222);

  // يستخدم كلون للنصوص الثانوية أو الأقل أهمية
  static const lightTextWeak = Color(0xFF999999);

  // الاستخدام: يستخدم كلون افتراضي للأيقونات.
  static const lightIconDefault = Color(0xFFB3B3B3);

  // يستخدم كلون للأيقونات عند تفعيلها أو تحديدها
  static const lightIconHighlighted = Color(0xFF222222);

  // يستخدم كلون لحدود العناصر مثل الحاويات أو الحقول
  static const lightBorderDefault = Color(0xFFF7F7F7);

  // يستخدم كتدرج لوني لحدود العناصر، مثل الأزرار أو البطاقات
  static const lightBorderGradient = [
    Color(0xFF007E6E),
    Color(0xFFD8FAFF),
    Color(0xFF007E6E),
  ]; // تدرج أزرق
  // الاستخدام: يستخدم كلون لعناصر الهيكل العظمي (Skeleton Loading) أثناء تحميل المحتوى.
  static const lightSkeleton = Color(0xFFF5F5F5);

  static const lightShadow = Color(0x2F000000);

  // =================================================

  static const darkBackground = Color(0xFF000000);

  static const darkSurface = Color(0xFF1F1B1F);

  static const darkSurfaceSecondary = Color(0xFF2C282C);

  static const darkScrim = Color(0xCC000000);

  static const darkTextDefault = Color(0xFFFFFFFF);

  static const darkTextWeak = Color(0xFF666666);

  static const darkIconDefault = Color(0xFF666666);

  static const darkIconHighlighted = Color(0xFFFFFFFF);

  static const darkBorderDefault = Color(0xFF323232);

  static const darkBorderGradient = [
    Color(0xFF797579),
    Color(0xFFFFFCFF),
    Color(0xFF797579),
  ];

  static const darkSkeleton = Color(0xFF292929);

  static const darkShadow = Color(0x2E000000);

  // static const textSubTitle = Color(0xff677294);
}

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.background,
    required this.surface,
    required this.surfaceSecondary,
    required this.scrim,
    required this.textDefault,
    required this.textWeak,
    required this.iconDefault,
    required this.iconHighlighted,
    required this.borderDefault,
    required this.borderGradient,
    required this.lightBorderGradient,
    required this.darkBorderGradient,
    required this.skeleton,
    required this.primaryColor,
    required this.bgPrimaryColor,
    required this.successColor,
    required this.bgSuccessColor,
    required this.errorColor,
    required this.bgErrorColor,
    required this.secondaryColor,
    required this.yellowColor,
    required this.shadowColor,
  });

  final Color background;

  final Color surface;

  final Color surfaceSecondary;

  final Color scrim;

  final Color textDefault;

  final Color textWeak;

  final Color iconDefault;

  final Color iconHighlighted;

  final Color borderDefault;

  final List<Color> borderGradient;

  final List<Color> lightBorderGradient;

  final List<Color> darkBorderGradient;

  final Color skeleton;

  final Color primaryColor;

  final Color bgPrimaryColor;

  final Color successColor;

  final Color bgSuccessColor;

  final Color errorColor;

  final Color bgErrorColor;

  final Color secondaryColor;

  final Color yellowColor;

  final Color shadowColor;

  @override
  AppColorsExtension copyWith({
    Color? background,
    Color? surface,
    Color? surfaceSecondary,
    Color? scrim,
    Color? textDefault,
    Color? textWeak,
    Color? iconDefault,
    Color? iconHighlighted,
    Color? borderDefault,
    List<Color>? borderGradient,
    List<Color>? lightBorderGradient,
    List<Color>? darkBorderGradient,
    Color? skeleton,
    Color? primaryColor,
    Color? bgPrimaryColor,
    Color? successColor,
    Color? bgSuccessColor,
    Color? errorColor,
    Color? bgErrorColor,
    Color? secondaryColor,
    Color? yellowColor,
    Color? shadowColor,
  }) {
    return AppColorsExtension(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      scrim: scrim ?? this.scrim,
      textDefault: textDefault ?? this.textDefault,
      textWeak: textWeak ?? this.textWeak,
      iconDefault: iconDefault ?? this.iconDefault,
      iconHighlighted: iconHighlighted ?? this.iconHighlighted,
      borderDefault: borderDefault ?? this.borderDefault,
      borderGradient: borderGradient ?? this.borderGradient,
      lightBorderGradient: lightBorderGradient ?? this.lightBorderGradient,
      darkBorderGradient: darkBorderGradient ?? this.darkBorderGradient,
      skeleton: skeleton ?? this.skeleton,
      primaryColor: primaryColor ?? this.primaryColor,
      bgPrimaryColor: bgPrimaryColor ?? this.bgPrimaryColor,
      successColor: successColor ?? this.successColor,
      bgSuccessColor: bgSuccessColor ?? this.bgSuccessColor,
      errorColor: errorColor ?? this.errorColor,
      bgErrorColor: bgErrorColor ?? this.bgErrorColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      yellowColor: yellowColor ?? this.yellowColor,
      shadowColor: shadowColor ?? this.shadowColor,
    );
  }

  @override
  AppColorsExtension lerp(AppColorsExtension? other, double t) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSecondary:
          Color.lerp(surfaceSecondary, other.surfaceSecondary, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
      textDefault: Color.lerp(textDefault, other.textDefault, t)!,
      textWeak: Color.lerp(textWeak, other.textWeak, t)!,
      iconDefault: Color.lerp(iconDefault, other.iconDefault, t)!,
      iconHighlighted: Color.lerp(iconHighlighted, other.iconHighlighted, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      borderGradient: [
        for (final (i, color) in borderGradient.indexed)
          Color.lerp(color, other.borderGradient[i], t)!,
      ],
      lightBorderGradient: lightBorderGradient,
      darkBorderGradient: darkBorderGradient,
      skeleton: Color.lerp(skeleton, other.skeleton, t)!,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      bgPrimaryColor: Color.lerp(bgPrimaryColor, other.bgPrimaryColor, t)!,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      bgSuccessColor: Color.lerp(bgSuccessColor, other.bgSuccessColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      bgErrorColor: Color.lerp(bgErrorColor, other.bgErrorColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      yellowColor: Color.lerp(yellowColor, other.yellowColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
    );
  }

  // Light Mode Colors
  static const light = AppColorsExtension(
    background: AppColors.lightBackground,
    surface: AppColors.lightSurface,
    surfaceSecondary: AppColors.lightSurfaceSecondary,
    scrim: AppColors.lightScrim,
    textDefault: AppColors.lightTextDefault,
    textWeak: AppColors.lightTextWeak,
    iconDefault: AppColors.lightIconDefault,
    iconHighlighted: AppColors.lightIconHighlighted,
    borderDefault: AppColors.lightBorderDefault,
    borderGradient: AppColors.lightBorderGradient,
    lightBorderGradient: AppColors.lightBorderGradient,
    darkBorderGradient: AppColors.darkBorderGradient,
    skeleton: AppColors.lightSkeleton,
    primaryColor: AppColors.primaryColor,
    bgPrimaryColor: AppColors.backgroundPrimaryColor,
    successColor: AppColors.successColor,
    bgSuccessColor: AppColors.backgroundSuccessColor,
    errorColor: AppColors.errorColor,
    bgErrorColor: AppColors.backgroundErrorColor,
    secondaryColor: AppColors.secondaryColor,
    yellowColor: AppColors.yellowColor,
    shadowColor: AppColors.lightShadow,
  );

  // Dark Mode Colors
  static const dark = AppColorsExtension(
    background: AppColors.darkBackground,
    surface: AppColors.darkSurface,
    surfaceSecondary: AppColors.darkSurfaceSecondary,
    scrim: AppColors.darkScrim,
    textDefault: AppColors.darkTextDefault,
    textWeak: AppColors.darkTextWeak,
    iconDefault: AppColors.darkIconDefault,
    iconHighlighted: AppColors.darkIconHighlighted,
    borderDefault: AppColors.darkBorderDefault,
    borderGradient: AppColors.darkBorderGradient,
    lightBorderGradient: AppColors.lightBorderGradient,
    darkBorderGradient: AppColors.darkBorderGradient,
    skeleton: AppColors.darkSkeleton,
    primaryColor: AppColors.primaryColor,
    bgPrimaryColor: AppColors.backgroundPrimaryColor,
    successColor: AppColors.successColor,
    bgSuccessColor: AppColors.backgroundSuccessColor,
    errorColor: AppColors.errorColor,
    bgErrorColor: AppColors.backgroundErrorColor,
    secondaryColor: AppColors.secondaryColor,
    yellowColor: AppColors.yellowColor,
    shadowColor: AppColors.darkShadow,
  );
}
