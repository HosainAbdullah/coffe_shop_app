import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/strings/strings_all_app.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/core/lang/app_localizations.dart';
import 'package:coffe_shop_app/features/home/presentation/screens/main_screen.dart';
import 'package:coffe_shop_app/core/widgets/buttons/button_back_app_bar.dart';
import 'package:flutter/material.dart';

// ! Done
class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  SearchLocationScreenState createState() => SearchLocationScreenState();
}

class SearchLocationScreenState extends State<SearchLocationScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Simulated search results
  List<String> searchResults = [
    "Golden Avenue\n8502 Preston Rd, Inglewood, CA",
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppBarTitle(
          title: StringsAllApp.enterYourLocationText.tr(context),
        ),
        leading: ButtonBackAppBar(),
      ),
      body: Padding(
        padding: SizeConfig.defaultPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            SearchTextFormField(searchController: _searchController),

            SizedBox(height: getScreenHeight(20)),

            // Option to use current location
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  SizeConfig.defaultRadius(size: 10),
                ),
              ),
              hoverColor: context.colors.bgPrimaryColor,
              leading: Icon(
                Icons.near_me_rounded,
                size: 28,
                color: context.colors.primaryColor, // Teal color
              ),
              title: Text(
                StringsAllApp.useMyCurrentLocationText.tr(context),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              onTap: () {},
            ),

            Divider(color: context.colors.bgPrimaryColor),
            SizedBox(height: getScreenHeight(10)),
            // Search Result
            Text(
              StringsAllApp.searchResultText.tr(context),
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: context.colors.textWeak),
            ),

            SizedBox(height: getScreenHeight(10)),

            // Display search results
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.defaultRadius(size: 10),
                    ),
                  ),
                  hoverColor: context.colors.bgPrimaryColor,
                  leading: Icon(
                    Icons.near_me_rounded,
                    size: 28,
                    color: context.colors.primaryColor, // Teal color
                  ),
                  title: Text(
                    searchResults[index].split("\n")[0],
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  subtitle: Text(
                    searchResults[index].split("\n")[1],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchController,

      decoration: InputDecoration(
        contentPadding: SizeConfig.horizontalPadding(),
        hintText: StringsAllApp.enterYourLocationText.tr(context),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            SizeConfig.defaultRadius(size: 10),
          ),
        ),
        hintStyle: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: context.colors.textWeak),
        filled: true,
        fillColor: context.colors.surfaceSecondary,
        prefixIcon: Icon(Icons.search, size: getFontSize(25)),

        suffixIcon: IconButton(
          icon: Icon(
            Icons.clear,
            size: getFontSize(25),
            color: context.colors.primaryColor,
          ),
          onPressed: () {
            _searchController.clear();
          },
        ),
      ),
      cursorHeight: getFontSize(20),
      cursorColor: context.colors.primaryColor,
      style: Theme.of(context).textTheme.titleLarge,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
    );
  }
}
