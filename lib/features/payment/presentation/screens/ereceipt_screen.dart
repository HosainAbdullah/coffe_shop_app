import 'package:coffe_shop_app/constants/path_const/assets_list.dart';
import 'package:coffe_shop_app/constants/path_const/local_path.dart';
import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/bottom_background_widget.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/custem_cached_network_image.dart';
import 'package:coffe_shop_app/core/widgets/detail_row_widget.dart';
import 'package:flutter/material.dart';

class EReceiptScreen extends StatelessWidget {
  const EReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBackAppBar(),
        centerTitle: true,
        title: AppBarTitle(title: 'E-Receipt'),
      ),

      body: SingleChildScrollView(
        padding: SizeConfig.defaultPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AssetsPath.assetsImages + AssetsListName.images[1],
                width: double.infinity,
                height: getScreenHeight(50),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    child: Center(
                      child: Text(
                        'Barcode',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: getScreenHeight(16)),
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
                      Text(
                        'by The Daily Grind Hub',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: getScreenHeight(20)),
            Divider(color: context.colors.shadowColor, height: 1),
            SizedBox(height: getScreenHeight(10)),
            DetailRowWidget(label: 'Order ID', value: 'CDR45HGJF'),
            DetailRowWidget(label: 'Order Type', value: 'Delivery'),
            DetailRowWidget(
              label: 'Delivery Address',
              value: 'Home (1901 Thornridge..)',
            ),
            DetailRowWidget(
              label: 'Order Date',
              value: 'Dec 27, 2023 | 10:00 AM',
            ),
            DetailRowWidget(label: 'Coupon Code', value: 'CF45AA2024'),
            SizedBox(height: getScreenHeight(10)),
            Divider(color: context.colors.shadowColor, height: 1),
            SizedBox(height: getScreenHeight(10)),
            DetailRowWidget(label: 'Sub Total', value: '\$19.50'),
            DetailRowWidget(label: 'Taxes', value: '+ \$02.00'),
            DetailRowWidget(label: 'Delivery Charge', value: '+ \$00.00'),
            DetailRowWidget(label: 'Discount', value: '- \$00.00'),
            DetailRowWidget(label: '50 Points', value: '- \$05.00'),
          ],
        ),
      ),
      bottomNavigationBar: BottomBackGroundWidget(
        child: PrimaryButtonApp(text: "Download E-Receipt", onPressed: () {}),
      ),
    );
  }
}
