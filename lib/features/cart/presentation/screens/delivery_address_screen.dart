import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/bottom_background_widget.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/core/widgets/buttons/secondary_button_app.dart';
import 'package:flutter/material.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  String _selectedAddress = 'Home';

  final List<Map<String, String>> _addresses = [
    {'label': 'Home', 'address': '1901 Thornridge Cir. Shiloh, Hawaii 81063'},
    {
      'label': 'Office',
      'address': '4517 Washington Ave. Manchester, Kentucky 39495',
    },
    {
      'label': 'Parent\'s House',
      'address': '8502 Preston Rd. Inglewood, Maine 98380',
    },
    {
      'label': 'Friend\'s House',
      'address': '2464 Royal Ln. Mesa, New Jersey 45463',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBackAppBar(),
        centerTitle: true,
        title: AppBarTitle(title: 'Delivery Address'),
      ),

      body: Padding(
        padding: SizeConfig.defaultPadding(),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _addresses.length,
                itemBuilder: (context, index) {
                  final address = _addresses[index];
                  return Column(
                    children: [
                      Padding(
                        padding: SizeConfig.verticalPadding(),
                        child: RadioListTile<String>(
                          value: address['label']!,
                          groupValue: _selectedAddress,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedAddress = value!;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          fillColor: WidgetStateProperty.all<Color>(
                            context.colors.primaryColor,
                          ),
                          title: Text(
                            address['label']!,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),

                          subtitle: Text(
                            address['address']!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),

                          secondary: Icon(
                            Icons.location_on,
                            color: context.colors.primaryColor,
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      if (index < _addresses.length - 1)
                        Divider(color: context.colors.shadowColor, height: 1),
                    ],
                  );
                },
              ),
            ),

            SecondaryButtonApp(
              text: "+ Add New Delivery Address",
              onPressed: () {},
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomBackGroundWidget(
        child: PrimaryButtonApp(text: "Apply", onPressed: () {}),
      ),
    );
  }
}
