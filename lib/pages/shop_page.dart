import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/components/category_select_button.dart';
import 'package:shopapp/components/my_drawer.dart';
import 'package:shopapp/components/shoe_banner.dart';
import 'package:shopapp/components/shoe_tile.dart';
import 'package:shopapp/components/text_field_search.dart';
import 'package:shopapp/pages/product_details.dart';
import 'package:shopapp/providerClass/main_provider_class.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //
  //
  //
  TextEditingController searchTextField =
      TextEditingController();
  //
  //
  String firstSearchResult = '';
  String searchResult = '';
  String currentCategory = 'all';
  //

  //
  //
  //
  List<String> person = ['Beans'];
  //
  //
  //
  //
  //
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Consumer<ProviderClass>(
        builder:
            (context, value, child) => Scaffold(
              //
              //
              appBar: AppBar(
                leadingWidth: 100,
                leading: Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(size: 32, Icons.menu),
                    );
                  },
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 18, // Adjust size
                      // backgroundImage: AssetImage(
                      //   'lib/images/shoe2.jpg',
                      // ), // Ensure this exists
                      backgroundColor:
                          Colors
                              .grey
                              .shade300, // Fallback color
                    ),
                  ),
                ],
              ),
              //
              //
              //
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    children: [
                      Column(
                        spacing: 10,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            "Search",
                          ),
                          TextFieldSearch(
                            searchShoe: (value) {},
                            searchTextField:
                                searchTextField,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            'Hot Deals',
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                              'See All',
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: searchResult.isNotEmpty,
                        child: Row(
                          children: [
                            Text('Search Result for '),
                            Text(
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700,
                              ),
                              '"$firstSearchResult"',
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: searchResult.isNotEmpty,
                        child: Text(searchResult),
                      ),
                      Visibility(
                        visible: searchResult.isEmpty,
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ListView.builder(
                            // Ensure ListView.builder works correctly
                            scrollDirection:
                                Axis.horizontal,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              ProductDetails(),
                                      settings: RouteSettings(
                                        arguments:
                                            value
                                                .shoes[index],
                                      ),
                                    ),
                                  );
                                },
                                child: ShoeBanner(
                                  shoe:
                                      value
                                          .allStorItems()[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        child: Row(
                          spacing: 10,
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CategorySelectButton(
                                title: 'All',
                                currentCategory:
                                    currentCategory,
                                onTap: () {
                                  setState(() {
                                    currentCategory = 'all';
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: CategorySelectButton(
                                title: 'Male',
                                currentCategory:
                                    currentCategory,
                                onTap: () {
                                  setState(() {
                                    currentCategory =
                                        'male';
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: CategorySelectButton(
                                title: 'Female',
                                currentCategory:
                                    currentCategory,
                                onTap: () {
                                  setState(() {
                                    currentCategory =
                                        'female';
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            currentCategory == 'male'
                                ? 'Male Products'
                                : currentCategory ==
                                    'female'
                                ? 'Female Items'
                                : 'All Items',
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                              'See All',
                            ),
                          ),
                        ],
                      ),
                      // Use Expanded for the ListView.builder that lists items
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount:
                            currentCategory == 'male'
                                ? value
                                    .allMaleItems()
                                    .length
                                : currentCategory ==
                                    'female'
                                ? value
                                    .allFemaleItems()
                                    .length
                                : value
                                    .allStorItems()
                                    .length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                            child: ShowTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            ProductDetails(),
                                    settings: RouteSettings(
                                      arguments:
                                          value
                                              .shoes[index],
                                    ),
                                  ),
                                );
                              },
                              shoe:
                                  currentCategory == 'male'
                                      ? value
                                          .allMaleItems()[index]
                                      : currentCategory ==
                                          'female'
                                      ? value
                                          .allFemaleItems()[index]
                                      : value
                                          .allStorItems()[index],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              drawer: MyDrawer(),
            ),
      ),
    );
  }
}
