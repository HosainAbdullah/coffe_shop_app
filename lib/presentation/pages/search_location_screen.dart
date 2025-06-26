import 'package:coffe_shop_app/constants/size/size_config.dart';
import 'package:coffe_shop_app/constants/theme/app_theme.dart';
import 'package:coffe_shop_app/presentation/pages/main_screen.dart';
import 'package:coffe_shop_app/presentation/widgets/buttons/button_back_app_bar.dart';
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
        title: AppBarTitle(title: "Enter Your Location"),
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
                size: 30,
                color: context.colors.primaryColor, // Teal color
              ),
              title: Text(
                "Use my current location",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              onTap: () {},
            ),

            Divider(color: context.colors.bgPrimaryColor),
            SizedBox(height: getScreenHeight(10)),
            // Search Results
            Text(
              "SEARCH RESULT",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(letterSpacing: 2),
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
                    size: 30,
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
        hintText: "Enter Your Location",
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
        prefixIcon: Icon(Icons.search, size: getFontSize(30)),

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
