import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/custem_cached_network_image.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String time;
  final String review;
  final double rating;
  final bool hasImages;

  const ReviewCard({
    super.key,
    required this.name,
    required this.time,
    required this.review,
    required this.rating,
    this.hasImages = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.defaultRadius()),
        side: BorderSide(color: context.colors.borderDefault, width: 1),
      ),
      child: Padding(
        padding: SizeConfig.defaultPadding(size: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      // radius: getScreenWidth(20),
                      width: getScreenWidth(40),
                      height: getScreenHeight(40),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.defaultRadius(size: 20),
                        ),
                      ),
                      child: const CustemCachedNetworkImage(
                        imagePath:
                            "https://images.pexels.com/photos/14879927/pexels-photo-14879927.jpeg",
                        sizeImage: SizeImage.small,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.colors.background,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.verified,
                          size: getFontSize(15),
                          color: context.colors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: getScreenWidth(12)),
                Expanded(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Text(time, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            SizedBox(height: getScreenHeight(8)),
            Text(review, style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: getScreenHeight(8)),
            Row(
              children: [
                ...List.generate(
                  5,
                  (index) => Icon(
                    Icons.star_rate_rounded,
                    color: context.colors.secondaryColor,
                    size: getFontSize(20),
                  ),
                ),
                SizedBox(width: getScreenWidth(8)),
                Text(
                  rating.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
            if (hasImages) ...[
              SizedBox(height: getScreenHeight(12)),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: getScreenWidth(100),
                      height: getScreenHeight(100),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.defaultRadius(size: 8),
                        ),
                      ),
                      child: const CustemCachedNetworkImage(
                        imagePath:
                            "https://images.pexels.com/photos/14879927/pexels-photo-14879927.jpeg",
                        sizeImage: SizeImage.medium,
                      ),
                    ),
                  ),
                  SizedBox(width: getScreenWidth(8)),
                  Expanded(
                    child: Container(
                      width: getScreenWidth(100),
                      height: getScreenHeight(100),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.defaultRadius(size: 8),
                        ),
                      ),
                      child: const CustemCachedNetworkImage(
                        imagePath:
                            "https://images.pexels.com/photos/14879927/pexels-photo-14879927.jpeg",
                        sizeImage: SizeImage.medium,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
