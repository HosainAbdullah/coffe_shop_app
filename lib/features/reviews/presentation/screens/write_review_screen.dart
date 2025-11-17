import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/strings/strings_all_app.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:coffe_shop_app/core/widgets/bottom_background_widget.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/buttons/secondary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/custem_cached_network_image.dart';
import 'package:coffe_shop_app/core/widgets/field/primary_text_form_field.dart';
import 'package:flutter/material.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBackAppBar(),
        centerTitle: true,
        title: AppBarTitle(title: StringsAllApp.writeReviewText.tr(context)),
      ),

      body: SingleChildScrollView(
        padding: SizeConfig.defaultPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: getScreenWidth(80),
                  height: getScreenHeight(80),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.defaultRadius(size: 10),
                    ),
                  ),
                  child: const CustemCachedNetworkImage(
                    imagePath:
                        "https://images.pexels.com/photos/14879927/pexels-photo-14879927.jpeg",
                    sizeImage: SizeImage.large,
                  ),
                ),
                SizedBox(width: getScreenWidth(12)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: getScreenWidth(3),
                  children: [
                    Text(
                      'Cappuccino',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Coffee | Qty: 02',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      '\$32.00',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: getScreenHeight(20)),
            Divider(color: context.colors.shadowColor, height: 1),
            SizedBox(height: getScreenHeight(20)),
            Center(
              child: Text(
                'How is your Coffee?',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(fontSize: getFontSize(24)),
              ),
            ),
            SizedBox(height: getScreenHeight(20)),
            Divider(color: context.colors.shadowColor, height: 1),
            SizedBox(height: getScreenHeight(20)),
            Center(
              child: Text(
                'Your overall rating',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating
                        ? Icons.star_rate_rounded
                        : Icons.star_border_rounded,
                    color: context.colors.secondaryColor,
                    size: getScreenWidth(40),
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: getScreenHeight(15)),
            Divider(color: context.colors.shadowColor, height: 1),
            SizedBox(height: getScreenHeight(20)),
            Text(
              'Add detailed review',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: getScreenHeight(10)),
            PrimaryTextFormField(
              controller: _reviewController,
              hintText: 'Enter here',
              maxLines: 5,
              contentPadding: SizeConfig.symmetricPadding(vertical: 10),
            ),
            SizedBox(height: getScreenHeight(5)),
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: SizeConfig.defaultPadding(size: 10),
                foregroundColor: context.colors.primaryColor,
              ),
              onPressed: () {},
              icon: Icon(Icons.camera_alt, color: context.colors.primaryColor),
              label: Text(
                'add photo',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: context.colors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBackGroundWidget(
        child: Row(
          children: [
            Expanded(
              child: SecondaryButtonApp(
                text: "Cancel",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(width: getScreenWidth(10)),
            Expanded(child: PrimaryButtonApp(text: "Submit", onPressed: () {})),
          ],
        ),
      ),
    );
  }
}
