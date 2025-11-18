import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/widgets/buttons/primary_button_app.dart';
import 'package:coffe_shop_app/features/payment/presentation/screens/add_money_screen.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ButtonBackAppBar(),
        centerTitle: true,
        title: AppBarTitle(title: 'Wallet'),
      ),
      body: Padding(
        padding: SizeConfig.horizontalPadding(),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            // Wallet balance card
            WalletBalanceCard(
              balance: '\$12,000.00',
              onAddMoneyPressed: () {
                // Logic to navigate to add money screen
                //
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddMoneyScreen()),
                );
              },
            ),

            // Transactions list
            SizedBox(height: getScreenHeight(24)),
            Text('Today', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: getScreenHeight(5)),
            TransactionItem(
              title: 'Money Added to Wallet',
              date: '27 December | 7:30 AM',
              amount: '+ \$500.00',
              balance: 'Balance \$12,000.00',
            ),

            SizedBox(height: getScreenHeight(16)),
            Text('Yesterday', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: getScreenHeight(5)),
            TransactionItem(
              title: 'Order ID #CDR45GHFJ',
              date: '26 December | 5:30 AM',
              amount: '- \$500.00',
              balance: 'Balance \$11,250.00',
            ),

            SizedBox(height: getScreenHeight(16)),
            Text(
              '25 December 2023',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: getScreenHeight(5)),
            TransactionItem(
              title: 'Refund for Order #CDR45GHDF',
              date: '25 December | 7:30 AM',
              amount: '+ \$500.00',
              balance: 'Balance \$11,250.00',
            ),
            SizedBox(height: getScreenHeight(10)),
            TransactionItem(
              title: 'Order ID #CDR45BGTH',
              date: '25 December | 7:30 AM',
              amount: '- \$250.00',
              balance: 'Balance \$11,250.00',
            ),
            SizedBox(height: getScreenHeight(10)),
            TransactionItem(
              title: 'Order ID #CDR45BGTH',
              date: '25 December | 7:30 AM',
              amount: '- \$250.00',
              balance: 'Balance \$11,250.00',
            ),
          ],
        ),
      ),
    );
  }
}

class WalletBalanceCard extends StatelessWidget {
  final String balance;
  final VoidCallback onAddMoneyPressed;

  const WalletBalanceCard({
    super.key,
    required this.balance,
    required this.onAddMoneyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.bgPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: SizeConfig.defaultPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wallet Balance',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: context.colors.textWeak,
                      ),
                    ),

                    Text(
                      balance,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: context.colors.background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.wallet, color: context.colors.primaryColor),
                ),
              ],
            ),
            SizedBox(height: getScreenHeight(16)),
            PrimaryButtonApp(text: "Add Money", onPressed: onAddMoneyPressed),
          ],
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final String balance;

  const TransactionItem({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = amount.startsWith('+');
    final amountColor =
        isPositive ? context.colors.successColor : context.colors.errorColor;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.shadowColor),
        borderRadius: BorderRadius.circular(10),
      ),
      // elevation: 4,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: SizeConfig.defaultPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                Text(
                  amount,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: amountColor),

                  // TextStyle(color: amountColor)
                ),
              ],
            ),
            SizedBox(height: getScreenHeight(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: context.colors.textWeak,
                  ),
                ),
                Text(
                  balance,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: context.colors.textWeak,
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
