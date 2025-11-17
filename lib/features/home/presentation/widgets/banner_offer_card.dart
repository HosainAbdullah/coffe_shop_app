import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/padding_horizontal.dart';
import 'package:flutter/material.dart';

class BannerOfferCard extends StatelessWidget {
  final String typeOffer;
  final String description;
  final String sizeOffer;
  final String image;

  const BannerOfferCard({
    super.key,
    required this.typeOffer,
    required this.description,
    required this.sizeOffer,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return PaddingHorizontal(
      child: Container(
        height: getScreenHeight(150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            SizeConfig.defaultRadius(size: 8),
          ),
          color: context.colors.surfaceSecondary,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: SizeConfig.defaultPadding(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: SizeConfig.defaultPadding(size: 5),
                      decoration: BoxDecoration(
                        color: context.colors.background,
                        borderRadius: BorderRadius.circular(
                          SizeConfig.defaultRadius(size: 20),
                        ),
                      ),
                      child: Text(
                        typeOffer,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: getFontSize(8),
                        ),
                      ),
                    ),
                    SizedBox(height: getScreenHeight(2)),
                    Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: getScreenHeight(5)),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.labelLarge,
                        children: [
                          TextSpan(text: 'تصل إلى '),
                          TextSpan(
                            text: sizeOffer,
                            style: Theme.of(
                              context,
                            ).textTheme.labelLarge?.copyWith(
                              color: context.colors.primaryColor,
                              fontSize: getFontSize(14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.primaryColor,
                        padding: EdgeInsets.zero,
                        minimumSize: Size(
                          getScreenWidth(120),
                          getScreenHeight(30),
                        ),
                      ),
                      child: Text(
                        "احصل على العرض",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: context.colors.background,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.elliptical(60, 80),
                bottomRight: Radius.elliptical(60, 80),
                topLeft: Radius.circular(SizeConfig.defaultRadius(size: 8)),
                bottomLeft: Radius.circular(SizeConfig.defaultRadius(size: 8)),
              ),
              child: Image.network(
                image,
                width: getScreenWidth(170),
                height: getScreenHeight(160),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
