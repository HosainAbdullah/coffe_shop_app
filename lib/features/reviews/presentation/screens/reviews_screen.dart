import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/strings/strings_all_app.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:coffe_shop_app/core/widgets/bottom_background_widget.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/field/primary_text_form_field.dart';
import 'package:coffe_shop_app/features/reviews/presentation/screens/write_review_screen.dart';
import 'package:coffe_shop_app/features/reviews/presentation/widgets/rating_bar_widget.dart';
import 'package:coffe_shop_app/features/reviews/presentation/widgets/review_card.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBackAppBar(),
        centerTitle: true,
        title: AppBarTitle(title: StringsAllApp.reviewsText.tr(context)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: SizeConfig.defaultPadding(),
              children: [
                SizedBox(
                  height: getScreenHeight(120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: getScreenWidth(155),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '4.8',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(fontSize: getFontSize(40)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star_rate_rounded,
                                  color: Colors.orange,
                                  size: getFontSize(30),
                                ),
                              ),
                            ),
                            Text(
                              '( 1050 ${StringsAllApp.reviewsText.tr(context)} )',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getScreenHeight(120),
                        child: VerticalDivider(
                          width: 1,

                          thickness: 1,
                          color: context.colors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: getScreenWidth(175),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBarWidget(
                              label: '5',
                              value: 0.9,
                              color: context.colors.primaryColor,
                            ),
                            RatingBarWidget(
                              label: '4',
                              value: 0.4,
                              color: context.colors.primaryColor,
                            ),
                            RatingBarWidget(
                              label: '3',
                              value: 0.2,
                              color: context.colors.primaryColor,
                            ),
                            RatingBarWidget(
                              label: '2',
                              value: 0.1,
                              color: context.colors.primaryColor,
                            ),
                            RatingBarWidget(
                              label: '1',
                              value: 0.05,
                              color: context.colors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getScreenHeight(12)),
                Divider(color: context.colors.shadowColor, height: 1),
                SizedBox(height: getScreenHeight(12)),
                PrimaryTextFormField(
                  hintText: StringsAllApp.searchInReviewsText.tr(context),
                  prefixIcon: Icon(
                    Icons.search,
                    color: context.colors.primaryColor,
                  ),
                ),
                SizedBox(height: getScreenHeight(12)),
                SizedBox(
                  height: getScreenHeight(30),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: getScreenWidth(90),
                        height: getScreenHeight(30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.defaultRadius(),
                          ),
                          border: Border.all(
                            color: context.colors.borderDefault,
                          ),
                          color: context.colors.background,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.filter_list,
                              color: context.colors.iconDefault,
                              size: getFontSize(20),
                            ),
                            Text(
                              "Filter",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                              color: context.colors.iconDefault,
                              size: getFontSize(25),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: getScreenWidth(10)),
                      ReviewsFilterButton(
                        title: "Verified",
                        isSelected: true,
                        onTap: () {},
                      ),
                      SizedBox(width: getScreenWidth(10)),
                      ReviewsFilterButton(
                        title: "Latest",
                        isSelected: true,
                        onTap: () {},
                      ),
                      SizedBox(width: getScreenWidth(10)),
                      ReviewsFilterButton(
                        title: "Detailed Reviews",
                        isSelected: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getScreenHeight(12)),
                Divider(color: context.colors.shadowColor, height: 1),
                SizedBox(height: getScreenHeight(12)),
                const ReviewCard(
                  name: 'Dale Thiel',
                  time: '11 months ago',
                  review:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                  rating: 5.0,
                  hasImages: false,
                ),
                const ReviewCard(
                  name: 'Tiffany Nietzsche',
                  time: '11 months ago',
                  review:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                  rating: 5.0,
                  hasImages: true,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBackGroundWidget(
        child: PrimaryButtonApp(
          text: StringsAllApp.writeReviewText.tr(context),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WriteReviewScreen()),
            );
          },
        ),
      ),
    );
  }
}

class ReviewsFilterButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const ReviewsFilterButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: getScreenHeight(30),
        padding: SizeConfig.horizontalPadding(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.defaultRadius()),
          border: Border.all(color: context.colors.borderDefault),
          color:
              isSelected
                  ? context.colors.primaryColor
                  : context.colors.background,
        ),
        child: Center(
          child: Text(
            title,
            style:
                isSelected
                    ? Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: context.colors.background,
                    )
                    : Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
