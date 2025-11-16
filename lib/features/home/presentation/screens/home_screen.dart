import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/strings/strings_all_app.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:coffe_shop_app/features/product/presentation/screens/product_details_screen.dart';
import 'package:coffe_shop_app/presentation/pages/wishlist_screen.dart';
import 'package:coffe_shop_app/core/widgets/padding_horizontal.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHomeScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              height: getScreenHeight(100),
              width: MediaQuery.of(context).size.width,
              constraints: BoxConstraints(
                maxHeight: getScreenHeight(100),
                minHeight: getScreenHeight(50),
              ),
              decoration: BoxDecoration(
                color: context.colors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(SizeConfig.defaultRadius()),
                  bottomRight: Radius.circular(SizeConfig.defaultRadius()),
                ),
              ),

              child: Padding(
                padding: SizeConfig.defaultPadding(),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: SizeConfig.horizontalPadding(
                            size: 15,
                          ),
                          hintText: StringsAllApp.searchText.tr(context),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                              SizeConfig.defaultRadius(size: 10),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: context.colors.primaryColor,
                          ),
                          hintStyle: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(color: context.colors.primaryColor),
                          filled: true,
                          fillColor: context.colors.background,
                        ),
                      ),
                    ),
                    SizedBox(width: getScreenWidth(10)),
                    IconButton(
                      icon: Icon(
                        Icons.filter_list_rounded,
                        color: context.colors.primaryColor,
                        size: getFontSize(30),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizeConfig.defaultRadius(size: 13),
                          ),
                        ),
                        padding: SizeConfig.defaultPadding(size: 10),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: getScreenHeight(10)),
            PaddingHorizontal(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special Offers",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),

                  TextButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: context.colors.primaryColor,
                      padding: EdgeInsets.zero,
                      minimumSize: Size(
                        getScreenWidth(80),
                        getScreenHeight(25),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: context.colors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 160,
              child: CarouselSlider(
                options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  viewportFraction: 1,
                  // height: MediaQuery.of(context).size.height * 0.2,
                  // enableInfiniteScroll: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
                // disableGesture: true,
                items: List.generate(5, (index) => const BannerOfferCard()),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 10,
                    height: 10,
                    margin: SizeConfig.horizontalPadding(size: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          i == _currentPage
                              ? context.colors.primaryColor
                              : context.colors.iconDefault,
                      // : Colors.grey[400],
                    ),
                  ),
              ],
            ),
            SizedBox(height: getScreenHeight(10)),

            // My Reward Section
            PaddingHorizontal(
              child: Text(
                "My Reward (3/4)",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox(height: getScreenHeight(10)),
            PaddingHorizontal(
              child: Container(
                padding: SizeConfig.defaultPadding(size: 10),
                decoration: BoxDecoration(
                  color: context.colors.background,
                  borderRadius: BorderRadius.circular(
                    SizeConfig.defaultRadius(),
                  ),
                  boxShadow: [
                    BoxShadow(blurRadius: 1, color: context.colors.shadowColor),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRewardCircle("Cup 1", true),
                    _buildRewardCircle("Cup 2", true),
                    _buildRewardCircle("Cup 3", true),
                    _buildRewardCircle("Cup 4", false),
                    _buildRewardCircle("Free", false),
                  ],
                ),
              ),
            ),

            // SizedBox(height: 20),

            // Featured Products Section
            PaddingHorizontal(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured Products",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),

                  TextButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: context.colors.primaryColor,
                      padding: EdgeInsets.zero,
                      minimumSize: Size(
                        getScreenWidth(80),
                        getScreenHeight(25),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: context.colors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 10),
            SizedBox(
              height: 220,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: coffeeProducts.length,
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),

                itemBuilder: (context, index) {
                  final product = coffeeProducts[index];
                  return ProductCard(
                    imageUrl: product['imageUrl'],
                    name: product['name'],
                    price: product['price'],
                    rating: product['rating'],
                    isFavorite: product['isFavorite'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(),
                        ),
                      );
                    },
                    onToggleFavorite: () {
                      // Logic to toggle favorite status
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ProductDetailsScreen(),
                      //   ),
                      // );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ProductDetailsScreen(),
                      //   ),
                      // );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildFeaturedProduct(
                  image:
                      "https://images.pexels.com/photos/14879927/pexels-photo-14879927.jpeg",
                  rating: 4.9,
                ),
                SizedBox(width: 16),
                _buildFeaturedProduct(
                  image:
                      "https://images.pexels.com/photos/14879927/pexels-photo-14879927.jpeg",
                  rating: 4.8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardCircle(String label, bool isActive) {
    return Container(
      margin: SizeConfig.horizontalPadding(size: 6),
      child: Column(
        children: [
          Container(
            width: getScreenWidth(40),
            height: getScreenHeight(40),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isActive
                      ? context.colors.primaryColor
                      : context.colors.surfaceSecondary,
            ),
            child: Center(
              child: Icon(
                Icons.local_drink,
                size: getFontSize(20),
                color:
                    isActive
                        ? context.colors.background
                        : context.colors.iconDefault,
              ),
            ),
          ),
          SizedBox(height: getScreenHeight(5)),
          Text(label, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }

  // Helper function to build featured products
  Widget _buildFeaturedProduct({
    required String image,
    required double rating,
  }) {
    return Expanded(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.yellow),
                  SizedBox(width: 5),
                  Text(
                    rating.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarHomeScreen extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.primaryColor, // Teal color
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 5,
        children: [
          Text(
            StringsAllApp.locationText.tr(context),
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(color: context.colors.background),
          ),
          SizedBox(width: getScreenHeight(10)),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: getFontSize(20),
                color: context.colors.secondaryColor,
              ),
              SizedBox(width: getScreenWidth(5)),
              Text(
                "New York, USA",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: context.colors.background,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                size: getFontSize(22),
                color: context.colors.secondaryColor,
              ),
            ],
          ),
        ],
      ),
      actionsPadding: SizeConfig.leftPadding(),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart, color: context.colors.background),
          onPressed: () {},
        ),
        SizedBox(width: getScreenWidth(10)),
        IconButton(
          icon: Icon(
            Icons.notifications_rounded,
            color: context.colors.background,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class BannerOfferCard extends StatelessWidget {
  const BannerOfferCard({super.key});

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
                        "Today's Offers",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: getFontSize(8),
                        ),
                      ),
                    ),
                    SizedBox(height: getScreenHeight(2)),
                    Text(
                      "Get Special Offer",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: getScreenHeight(5)),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.labelLarge,
                        children: [
                          TextSpan(text: 'Up to '),
                          TextSpan(
                            text: ' 20%',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0C544C),
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
                        "Order Now",
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
                topLeft: Radius.elliptical(60, 80),
                bottomLeft: Radius.elliptical(60, 80),
                topRight: Radius.circular(SizeConfig.defaultRadius(size: 8)),
                bottomRight: Radius.circular(SizeConfig.defaultRadius(size: 8)),
              ),
              child: Image.network(
                "https://images.pexels.com/photos/14879927/pexels-photo-14879927.jpeg",
                width: getScreenWidth(170),
                height: getScreenHeight(150),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class TopHalfCircleClipper extends CustomClipper<RRect> {
//   @override
//   RRect getClip(Size size) {
//     // هنا نحدد منطقة القص كـ زاوية مستديرة (RRect)
//     return RRect.fromRectAndRadius(
//       Rect.fromLTRB(size.width, 0, 0, size.height),
//       //  fromLTWH(0, 0, size.width, size.height),
//       const Radius.elliptical(20, 80), // زوايا مستديرة
//     );
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
//     return false;
//   }
// }
