import 'dart:ui';

import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/bottom_background_widget.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/buttons/secondary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/custem_cached_network_image.dart';
import 'package:coffe_shop_app/core/widgets/detail_row_widget.dart';
import 'package:coffe_shop_app/features/cart/presentation/screens/delivery_address_screen.dart';
import 'package:coffe_shop_app/features/payment/presentation/screens/payment_methods_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _quantity = 2;
  bool _isDelivery = true;

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
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            barrierColor: Colors.black.withAlpha(50),
                            builder: (context) => AlertDeleteWidget(),
                          );
                        },
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
            const DetailRowWidget(label: 'Coffee Type', value: 'Hot'),
            Divider(color: context.colors.shadowColor, height: 1),
            const DetailRowWidget(label: 'Default Price', value: '\$16.00'),
            const DetailRowWidget(label: 'Size (Medium)', value: '+ \$1.50'),
            const DetailRowWidget(label: 'Sugar (Moderate)', value: '+ \$0.00'),
            const DetailRowWidget(
              label: 'Syrup (Chocolate)',
              value: '+ \$1.00',
            ),
            const DetailRowWidget(label: 'Topping (Cocoa.)', value: '+ \$1.00'),
            SizedBox(height: getScreenHeight(5)),
            Divider(color: context.colors.shadowColor, height: 1),
            SizedBox(height: getScreenHeight(5)),
            const DetailRowWidget(
              label: 'Sub Total',
              value: '\$19.50',
              isBold: true,
            ),
            SizedBox(height: getScreenHeight(8)),
            Divider(color: context.colors.shadowColor, height: 1),
            SizedBox(height: getScreenHeight(20)),
            Text(
              'Order Type',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: getScreenHeight(8)),
            ToggleButtons(
              isSelected: [_isDelivery, !_isDelivery],
              onPressed: (int index) {
                setState(() {
                  _isDelivery = index == 0;
                });
              },
              borderRadius: BorderRadius.circular(8),
              borderWidth: 0,
              selectedColor: context.colors.background,
              fillColor: context.colors.primaryColor,
              constraints: BoxConstraints(
                minWidth: getScreenWidth(170),
                minHeight: getScreenHeight(48),
              ),
              children: [
                Text(
                  'Delivery',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color:
                        _isDelivery
                            ? context.colors.background
                            : context.colors.textDefault,
                  ),
                ),
                Text(
                  'Pickup',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color:
                        !_isDelivery
                            ? context.colors.background
                            : context.colors.textDefault,
                  ),
                ),
              ],
            ),
            SizedBox(height: getScreenHeight(12)),
            _isDelivery
                ? const MyDeliveryWidget()
                : MyPickupWidget(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      barrierColor: Colors.black.withAlpha(50),
                      builder: (context) => DateTimeWidget(),
                    );
                  },
                ),
            // : MyPickupWidget(onPressed: _showPickupTimeDialog),
            const DetailRowWidget(
              label: 'Total Amount',
              value: '\$19.50',
              isBold: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBackGroundWidget(
        child: PrimaryButtonApp(text: "Place Order", onPressed: () {}),
      ),
    );
  }
}

class AlertDeleteWidget extends StatelessWidget {
  const AlertDeleteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 3,
              width: 100,
              decoration: BoxDecoration(
                color: context.colors.skeleton,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(height: getScreenHeight(16)),
            Text(
              'Remove from Cart ?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
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
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: getScreenHeight(20)),
            Row(
              children: [
                Expanded(
                  child: SecondaryButtonApp(text: "Cancel", onPressed: () {}),
                ),
                SizedBox(width: getScreenWidth(10)),
                Expanded(
                  child: PrimaryButtonApp(
                    text: "Yes, Remove",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentMethodsScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 3,
              width: 100,
              decoration: BoxDecoration(
                color: context.colors.skeleton,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(height: getScreenHeight(16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PICKUP NOW',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Pickup Time',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: context.colors.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: getScreenHeight(6)),
            Divider(color: context.colors.shadowColor, height: 1),
            SizedBox(
              height: 250,
              child: CupertinoDatePicker(
                initialDateTime: DateTime(1999),
                onDateTimeChanged: (d) {},
                // dateOrder: DatePickerDateOrder.mdy,

                // backgroundColor:
                //     context.colors.primaryColor,
              ),
            ),
            PrimaryButtonApp(
              text: "Confirm",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        // SizedBox(height: getScreenHeight(10)),
        Row(
          children: [
            Icon(Icons.location_on, color: context.colors.primaryColor),
            // const SizedBox(width: 8),
            SizedBox(width: getScreenWidth(10)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Home', style: Theme.of(context).textTheme.labelMedium),
                  Text(
                    '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: context.colors.background,
                side: BorderSide(
                  color: context.colors.borderDefault,
                  width: 1.5,
                ),
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size(getScreenWidth(70), getScreenHeight(25)),
              ),
              onPressed: () {
                // Change address
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryAddressScreen(),
                  ),
                );
              },
              child: Text(
                'CHANGE',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: context.colors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: getScreenHeight(8)),
        Row(
          children: [
            Icon(Icons.timer, color: context.colors.iconDefault, size: 16),
            SizedBox(width: getScreenWidth(8)),
            Text(
              '25 Minute estimated arrived',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: getScreenHeight(20)),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pickup Address',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: getScreenHeight(10)),
        Row(
          children: [
            Icon(Icons.store, color: context.colors.primaryColor),
            SizedBox(width: getScreenWidth(8)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The Daily Grind Hub',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    '3517 W. Gray St. Utica, Pennsylvania 57867',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: getScreenHeight(8)),
        Row(
          children: [
            Icon(
              Icons.directions_walk,
              color: context.colors.iconDefault,
              size: getFontSize(16),
            ),
            SizedBox(width: getScreenWidth(8)),
            Text(
              '1.2 km away from your location',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: getScreenHeight(16)),
        SecondaryButtonApp(text: "Choose Pickup Time", onPressed: onPressed),
        SizedBox(height: getScreenHeight(20)),
      ],
    );
  }
}
