import 'dart:ui';

import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/buttons/secondary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/custem_cached_network_image.dart';
import 'package:coffe_shop_app/presentation/pages/delivery_address_screen.dart';
import 'package:coffe_shop_app/presentation/pages/payment_methods_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _quantity = 2;
  bool _isDelivery = true;

  void _showRemoveDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.2),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text(
              'Remove from Cart?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            content: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://images.pexels.com/photos/14879927/pexels-photo-14879927.jpeg', // Replace with actual image URL
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.coffee, size: 60);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cappuccino',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Coffee | Qty: 02',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Implement remove logic here
                    // Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentMethodsScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Yes, Remove'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _selectedPickupDay = 'Mon 19 Feb';

  final List<Map<String, String>> _pickupTimes = [
    {
      'day': 'Sat',
      'date': '17',
      'time1': '5:58',
      'time2': '5:58',
      'period': '',
    },
    {
      'day': 'Fri',
      'date': '18',
      'time1': '5:59',
      'time2': '5:59',
      'period': 'AM',
    },
    {
      'day': 'Mon',
      'date': '19',
      'time1': '12:00',
      'time2': '12:00',
      'period': 'PM',
    },
    {
      'day': 'Tue',
      'date': '20',
      'time1': '1:01',
      'time2': '1:01',
      'period': '',
    },
    {
      'day': 'Wed',
      'date': '21',
      'time1': '2:02',
      'time2': '2:02',
      'period': '',
    },
    {
      'day': 'Thu',
      'date': '22',
      'time1': '3:03',
      'time2': '3:03',
      'period': '',
    },
  ];

  void _showPickupTimeDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.2),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      children: [
                        Text(
                          'Pickup Time',
                          style: Theme.of(context).textTheme.headlineMedium,
                          // TextStyle(
                          //   fontSize: 18,
                          //   fontWeight: FontWeight.bold,
                          // ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Select pickup now
                          },
                          child: Text(
                            'PICKUP NOW',
                            style: Theme.of(context).textTheme.headlineMedium,
                            // TextStyle(
                            // color: Colors.green,
                            // fontWeight: FontWeight.bold,
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: _pickupTimes.length,
                      itemBuilder: (context, index) {
                        final map = _pickupTimes[index];
                        final dayStr = '${map['day']} ${map['date']} Feb';
                        final isSelected = dayStr == _selectedPickupDay;
                        final color = isSelected ? Colors.green : Colors.black;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedPickupDay = dayStr;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  dayStr,
                                  style: TextStyle(
                                    color: color,
                                    fontWeight:
                                        isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  map['time1']!,
                                  style: TextStyle(color: color),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  map['time2']!,
                                  style: TextStyle(color: color),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  map['period']!,
                                  style: TextStyle(color: color),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Confirm'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBackAppBar(),
        centerTitle: true,
        title: AppBarTitle(title: 'My Cart'),
      ),
      body: SingleChildScrollView(
        padding: SizeConfig.defaultPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Details',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: context.colors.primaryColor,
                    size: getFontSize(20),
                  ),
                  onPressed: () {
                    // Edit order details
                  },
                ),
              ],
            ),
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
                Expanded(
                  child: Column(
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
                      TextButton(
                        onPressed: _showRemoveDialog,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(
                            getScreenWidth(60),
                            getScreenHeight(30),
                          ),
                          foregroundColor: context.colors.errorColor,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Remove',
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(
                            color: context.colors.errorColor,
                            decoration: TextDecoration.underline,
                            decorationColor: context.colors.errorColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: getScreenWidth(10),
                  children: [
                    SizedBox(
                      width: getScreenWidth(35),
                      height: getScreenHeight(35),
                      child: SecondaryButtonApp(
                        text: '',
                        child: Icon(
                          Icons.remove,
                          size: getFontSize(20),
                          color: context.colors.primaryColor,
                        ),
                        onPressed: () {
                          if (_quantity > 1) {
                            setState(() {
                              _quantity--;
                            });
                          }
                        },
                      ),
                    ),
                    Text(
                      "$_quantity",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(
                      width: getScreenWidth(35),
                      height: getScreenHeight(35),
                      child: PrimaryButtonApp(
                        text: '',
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                        child: Icon(
                          Icons.add,
                          size: getFontSize(20),
                          color: context.colors.background,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: getScreenHeight(16)),
            const _OrderDetailRow(label: 'Coffee Type', value: 'Hot'),
            Divider(color: context.colors.shadowColor, height: 1),
            const _OrderDetailRow(label: 'Default Price', value: '\$16.00'),
            const _OrderDetailRow(label: 'Size (Medium)', value: '+ \$1.50'),
            const _OrderDetailRow(label: 'Sugar (Moderate)', value: '+ \$0.00'),
            const _OrderDetailRow(
              label: 'Syrup (Chocolate)',
              value: '+ \$1.00',
            ),
            const _OrderDetailRow(label: 'Topping (Cocoa.)', value: '+ \$1.00'),
            const Divider(height: 32),
            const _OrderDetailRow(
              label: 'Sub Total',
              value: '\$19.50',
              isBold: true,
            ),
            const SizedBox(height: 24),
            const Text(
              'Order Type',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ToggleButtons(
              isSelected: [_isDelivery, !_isDelivery],
              onPressed: (int index) {
                setState(() {
                  _isDelivery = index == 0;
                });
              },
              borderRadius: BorderRadius.circular(8),
              selectedColor: Colors.white,
              fillColor: Colors.green,
              color: Colors.black,
              constraints: BoxConstraints(
                minWidth: (MediaQuery.of(context).size.width - 32) / 2,
                minHeight: 48,
              ),
              children: const [Text('Delivery'), Text('Pickup')],
            ),
            const SizedBox(height: 24),
            _isDelivery
                ? const MyDeliveryWidget()
                : MyPickupWidget(onPressed: _showPickupTimeDialog),
            const _OrderDetailRow(
              label: 'Total Amount',
              value: '\$19.50',
              isBold: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
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
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: context.colors.primaryColor,
              minimumSize: Size(MediaQuery.of(context).size.width / 2, 55),
            ),
            // icon: Icon(
            //   Icons.shopping_cart,
            //   size: 25,
            //   color: context.colors.background,
            // ),
            child: Text(
              'Place Order',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: context.colors.background,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyDeliveryWidget extends StatelessWidget {
  const MyDeliveryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Delivery Address',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on, color: Colors.green),
            const SizedBox(width: 8),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                // Change address
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryAddressScreen(),
                  ),
                );
              },
              child: const Text(
                'CHANGE',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            Icon(Icons.timer, color: Colors.grey, size: 16),
            SizedBox(width: 8),
            Text(
              '25 Minute estimated arrived',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class MyPickupWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const MyPickupWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Pickup Address',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.store, color: Colors.green),
            const SizedBox(width: 8),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Daily Grind Hub',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '3517 W. Gray St. Utica, Pennsylvania 57867',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            Icon(Icons.directions_walk, color: Colors.grey, size: 16),
            SizedBox(width: 8),
            Text(
              '1.2 km away from your location',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            side: const BorderSide(color: Colors.grey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Choose Pickup Time',
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _OrderDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _OrderDetailRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SizeConfig.verticalPadding(size: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
