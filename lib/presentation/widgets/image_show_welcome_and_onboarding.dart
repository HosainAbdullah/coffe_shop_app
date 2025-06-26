import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:flutter/material.dart';

class ImageShowWelcomeAndOnBoarding extends StatelessWidget {
  final String imageUrl;
  final double height;

  const ImageShowWelcomeAndOnBoarding({
    super.key,
    required this.imageUrl,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(
            getScreenWidth(200),
            getScreenHeight(50),
          ),
          bottomRight: Radius.elliptical(
            getScreenWidth(200),
            getScreenHeight(50),
          ),
        ),
      ),
      child: Image.asset(
        imageUrl,
        width: double.infinity,
        height: getScreenHeight(height),
        fit: BoxFit.cover,
      ),
    );
  }
}
