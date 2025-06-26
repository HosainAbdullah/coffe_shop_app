import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/circle_button_widget.dart';
import 'package:coffe_shop_app/presentation/widgets/custem_cached_network_image.dart';
import 'package:coffe_shop_app/presentation/widgets/padding_horizontal.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: getScreenHeight(340),
            child: const CustemCachedNetworkImage(
              imagePath:
                  "https://images.pexels.com/photos/14879927/pexels-photo-14879927.jpeg",
              sizeImage: SizeImage.large,
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getScreenHeight(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonBackAppBar(),
                    Row(
                      children: [
                        CircleButtonWidget(
                          icon: Icons.favorite,
                          onPressed: () {},
                        ),
                        CircleButtonWidget(
                          icon: Icons.share,
                          onPressed: () {},
                          color: context.colors.textDefault,
                        ),
                        SizedBox(width: getScreenWidth(10)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: getScreenHeight(155)),
                PaddingHorizontal(
                  child: Container(
                    width: getScreenWidth(60),
                    padding: SizeConfig.symmetricPadding(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: context.colors.background,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: context.colors.secondaryColor,
                          size: getFontSize(25),
                        ),
                        Text(
                          "4.5",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          draggbleWidget(),
        ],
      ),
      bottomSheet: Container(
        height: 100,
        decoration: BoxDecoration(
          color: context.colors.background,
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeConfig.defaultRadius()),
            topRight: Radius.circular(SizeConfig.defaultRadius()),
          ),
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.5)],
        ),
        child: Padding(
          padding: SizeConfig.horizontalPadding(size: 16),
          child: BottomActions(
            price: '\$16.00',
            onAddToCart: () {
              // Logic to add to cart
            },
          ),
        ),
      ),
    );
  }

  DraggableScrollableSheet draggbleWidget() {
    return DraggableScrollableSheet(
      initialChildSize: 0.62, // الحجم الأولي للجزء السفلي
      minChildSize: 0.62, // الحد الأدنى للحجم عند السحب
      maxChildSize: 1.0, // الحد الأقصى للحجم عند السحب
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: context.colors.background,
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeConfig.defaultRadius()),
              topRight: Radius.circular(SizeConfig.defaultRadius()),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: SizeConfig.horizontalPadding(size: 16),
              child: const PageContent(),
            ),
          ),
        );
      },
    );
  }
}

class PageContent extends StatelessWidget {
  const PageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getScreenHeight(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Coffee",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: context.colors.textWeak,
              ),
            ),

            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    backgroundColor: context.colors.skeleton,
                    minimumSize: Size(35, 35),
                    padding: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "-",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  onPressed: () {},
                ),
                Text("1", style: Theme.of(context).textTheme.headlineLarge),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    backgroundColor: context.colors.primaryColor,
                    minimumSize: Size(35, 35),
                    padding: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "+",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: context.colors.background,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        Text("Cappuccino", style: Theme.of(context).textTheme.displayMedium),
        SizedBox(height: getScreenHeight(10)),
        Text("Seller", style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: getScreenHeight(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: getScreenWidth(10),
              children: [
                Container(
                  height: getScreenHeight(55),
                  width: getScreenWidth(55),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // شكل دائري
                    // border: Border.all(
                    //   color: context.colors.secondaryColor, // لون الحدود
                    //   width: 1.0, // عرض الحدود
                    //   strokeAlign: BorderSide.strokeAlignOutside,
                    // ),
                  ),
                  child: const CustemCachedNetworkImage(
                    imagePath: "https://picsum.photos/id/193/200/300",
                    sizeImage: SizeImage.small,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Text(
                      "Jenny Wilson",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Owner (Zenith Zen Café)",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CircleButtonWidget(
                  onPressed: () {},
                  icon: Icons.message_rounded,
                  color: context.colors.primaryColor,
                  colorBorder: Colors.transparent,
                  backgroundColor: context.colors.skeleton,
                ),
                CircleButtonWidget(
                  onPressed: () {},
                  color: context.colors.primaryColor,
                  colorBorder: Colors.transparent,
                  backgroundColor: context.colors.skeleton,
                  icon: Icons.phone,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: getScreenHeight(10)),
        // Description section
        DescriptionSection(
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          onReadMore: () {
            // Logic to expand description
          },
        ),
        SizedBox(height: getScreenHeight(10)),
        Divider(),
        SizedBox(height: getScreenHeight(10)),
        // Available in section
        AvailableIn(
          stores: [
            {'icon': Icons.local_drink, 'name': 'Store 1'},
            {'icon': Icons.coffee, 'name': 'Store 2'},
          ],
        ),
      ],
    );
  }
}

class DescriptionSection extends StatelessWidget {
  final String description;
  final VoidCallback onReadMore;

  const DescriptionSection({
    super.key,
    required this.description,
    required this.onReadMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(height: 8),
        Text(description, style: Theme.of(context).textTheme.titleMedium),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Read more',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: context.colors.primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class AvailableIn extends StatelessWidget {
  final List<Map<String, dynamic>> stores;

  const AvailableIn({super.key, required this.stores});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available in',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colors.primaryColor,
                  // color: context.colors.borderDefault,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Icon(
                    Icons.coffee,
                    size: 40,
                    color: context.colors.primaryColor,
                  ),
                  Text("Coffe", style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BottomActions extends StatelessWidget {
  final String price;
  final VoidCallback onAddToCart;

  const BottomActions({
    super.key,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Price', style: TextStyle(fontSize: 14)),
            // Spacer(),
            Text(
              price,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        // SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: onAddToCart,
          icon: Icon(
            Icons.shopping_cart,
            size: 25,
            color: context.colors.background,
          ),
          label: Text(
            'Add to Cart',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: context.colors.background,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: context.colors.primaryColor,
            minimumSize: Size(MediaQuery.of(context).size.width / 2, 55),
          ),
        ),
      ],
    );
  }
}
