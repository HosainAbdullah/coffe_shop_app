import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/button_back_app_bar.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Added
      initialIndex: 0, //Added
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Wishlist',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: ButtonBackAppBar(),
          bottom: TabBar(
            padding: SizeConfig.horizontalPadding(),
            dividerColor: context.colors.borderDefault,
            labelColor: context.colors.primaryColor,
            labelStyle: Theme.of(context).textTheme.headlineLarge,
            unselectedLabelColor: context.colors.textWeak,
            indicatorColor: context.colors.primaryColor,
            // tabAlignment: TabAlignment.,
            // textScaler: TextScaler.linear(1),

            // isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,

            // indicatorPadding: EdgeInsets.zero,
            splashBorderRadius: BorderRadius.circular(10),
            indicatorWeight: 4,
            overlayColor: WidgetStateProperty.resolveWith((states) {
              return states.contains(WidgetState.pressed)
                  ? context.colors.bgPrimaryColor
                  : null;
            }),

            tabs: [Tab(text: 'Coffee'), Tab(text: 'Cafe')],
          ),
        ),
        body: TabBarView(
          children: [
            // Coffee tab content
            GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.85,
              ),
              itemCount: coffeeProducts.length,
              itemBuilder: (context, index) {
                final product = coffeeProducts[index];
                return ProductCard(
                  imageUrl: product['imageUrl'],
                  name: product['name'],
                  price: product['price'],
                  rating: product['rating'],
                  isFavorite: product['isFavorite'],
                  onToggleFavorite: () {
                    // Logic to toggle favorite status
                  },
                );
              },
            ),

            // Cafe tab content
            GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.85,
              ),
              itemCount: cafeProducts.length,
              itemBuilder: (context, index) {
                final product = cafeProducts[index];
                return ProductCard(
                  imageUrl: product['imageUrl'],
                  name: product['name'],
                  price: product['price'],
                  rating: product['rating'],
                  isFavorite: product['isFavorite'],
                  onToggleFavorite: () {
                    // Logic to toggle favorite status
                  },
                );
              },
            ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}

// Sample data for coffee and cafe products
final List<Map<String, dynamic>> coffeeProducts = [
  {
    'imageUrl':
        'https://images.pexels.com/photos/15221973/pexels-photo-15221973.jpeg',
    'name': 'Harmony Hues',
    'price': '\$25.00',
    'rating': 4.9,
    'isFavorite': true,
  },
  {
    'imageUrl':
        'https://images.pexels.com/photos/15221973/pexels-photo-15221973.jpeg',
    'name': 'Bean Bliss',
    'price': '\$12.00',
    'rating': 4.7,
    'isFavorite': true,
  },
  {
    'imageUrl':
        'https://images.pexels.com/photos/15221973/pexels-photo-15221973.jpeg',
    'name': 'Latte Lullaby',
    'price': '\$18.00',
    'rating': 4.8,
    'isFavorite': false,
  },
];

final List<Map<String, dynamic>> cafeProducts = [
  {
    'imageUrl':
        'https://images.pexels.com/photos/15221973/pexels-photo-15221973.jpeg',
    'name': 'Coffee Canvas',
    'price': '\$20.00',
    'rating': 4.8,
    'isFavorite': true,
  },
  {
    'imageUrl':
        'https://images.pexels.com/photos/15221973/pexels-photo-15221973.jpeg',
    'name': 'Espresso Euphoria',
    'price': '\$21.00',
    'rating': 4.8,
    'isFavorite': true,
  },
  {
    'imageUrl':
        'https://images.pexels.com/photos/15221973/pexels-photo-15221973.jpeg',
    'name': 'SavorSphere',
    'price': '\$25.00',
    'rating': 5.0,
    'isFavorite': false,
  },
];

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final double rating;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 200,
          minHeight: 100,
          maxWidth: 200,
          minWidth: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 130,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                // SizedBox(height: 290),
                // Text(
                //   name,
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: context.colors.background,
                    ),
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: onToggleFavorite,
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 8,
                  child: Container(
                    padding: SizeConfig.symmetricPadding(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: context.colors.background,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(color: context.colors.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 10),
            Padding(
              padding: SizeConfig.defaultPadding(size: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(price, style: TextStyle(fontSize: 14)),
                  // SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
