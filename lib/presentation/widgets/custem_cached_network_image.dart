import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:flutter/material.dart';

enum SizeImage { large, medium, small }

class CustemCachedNetworkImage extends StatelessWidget {
  const CustemCachedNetworkImage({
    super.key,
    required this.sizeImage,
    required this.imagePath,
  });

  final SizeImage sizeImage;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      fit: BoxFit.cover,
      placeholder:
          (context, url) => Center(
            child: CircularProgressIndicator(
              color: context.colors.primaryColor,
              backgroundColor: context.colors.bgPrimaryColor,
            ),
          ),
      errorWidget: (context, url, error) {
        if (sizeImage == SizeImage.large || sizeImage == SizeImage.medium) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              const Icon(Icons.error),
              Text(
                "حدث خطا أثناء تحميل الصورة",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          );
        } else {
          return const Center(child: Icon(Icons.error));
        }
      },
    );
  }
}
