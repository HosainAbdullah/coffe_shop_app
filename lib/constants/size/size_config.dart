import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double defaultSize = getScreenWidth(20.0);
  static late Orientation orientation;

  void init({required BuildContext context}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

  static EdgeInsets defaultPadding({double size = 16}) {
    return EdgeInsets.all(getScreenWidth(size));
  }

  static EdgeInsets rightPadding({double size = 16}) {
    return EdgeInsets.only(right: getScreenWidth(size));
  }

  static EdgeInsets leftPadding({double size = 16}) {
    return EdgeInsets.only(left: getScreenWidth(size));
  }

  static EdgeInsets bottomPadding({double size = 16}) {
    return EdgeInsets.only(bottom: getScreenWidth(size));
  }

  static EdgeInsets topPadding({double size = 16}) {
    return EdgeInsets.only(top: getScreenWidth(size));
  }

  static EdgeInsets horizontalPadding({double size = 16}) {
    return EdgeInsets.symmetric(horizontal: getScreenWidth(size));
  }

  static EdgeInsets verticalPadding({double size = 16}) {
    return EdgeInsets.symmetric(vertical: getScreenWidth(size));
  }

  static EdgeInsets onlyPadding({
    double top = 16,
    double left = 16,
    double right = 16,
    double bottom = 16,
  }) {
    return EdgeInsets.only(
      top: getScreenWidth(top),
      left: getScreenWidth(left),
      right: getScreenWidth(right),
      bottom: getScreenWidth(bottom),
    );
  }

  static EdgeInsets symmetricPadding({
    double vertical = 16,
    double horizontal = 16,
  }) {
    return EdgeInsets.symmetric(
      vertical: getScreenWidth(vertical),
      horizontal: getScreenWidth(horizontal),
    );
  }

  static double defaultRadius({double size = 15.0}) {
    return getScreenWidth(size);
  }
}

double getScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

double getScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}

double getFontSize(double inputFontSize) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputFontSize / 375.0) * screenWidth;
}
