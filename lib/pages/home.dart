import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/components/bottom_nav_bar.dart';
import 'package:shopapp/pages/cart_page.dart';
import 'package:shopapp/pages/shop_page.dart';
import 'package:shopapp/providerClass/main_provider_class.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int? pageIndex;
  HomePage({super.key, this.pageIndex});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  //
  //

  // int _selectedIndex = 0;
  // void onTabChanged(index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  //
  //
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];
  //
  //
  //
  //
  //
  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.pageIndex != null) {
  //     setState(() {
  //       _selectedIndex = 1;
  //     });
  //   } else {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _pages[context
              .watch<ProviderClass>()
              .currentPage],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) {
          context.read<ProviderClass>().changeCurrentPage(
            index,
          );
        },
      ),
      // drawer: MyDrawer(),
    );
  }
}
