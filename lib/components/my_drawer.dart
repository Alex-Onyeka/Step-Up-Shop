import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/components/my_list_tile.dart';
import 'package:shopapp/pages/intro_page.dart';
import 'package:shopapp/providerClass/main_provider_class.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List index = ['Home', 'Cart'];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 80),
          Image.asset('lib/images/logo.png', height: 80),
          SizedBox(height: 20),
          Expanded(
            child: Column(
              spacing: 20,
              children: [
                MyListTile(
                  onTap: () {
                    context
                        .read<ProviderClass>()
                        .changeCurrentPage(0);
                    Navigator.of(context).pop();
                  },
                  index: 0,
                  icon: Icons.home,
                  text: 'Home Page',
                  lastIcon: Icons.arrow_forward_ios_rounded,
                ),
                MyListTile(
                  onTap: () {
                    context
                        .read<ProviderClass>()
                        .changeCurrentPage(1);
                    Navigator.of(context).pop();
                  },
                  index: 1,
                  icon: Icons.shopping_cart_outlined,
                  text: 'Cart Page',
                  lastIcon: Icons.arrow_forward_ios_rounded,
                ),
              ],
            ),
          ),
          MyListTile(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return IntroPage();
                  },
                ),
                (route) {
                  return true;
                },
              );
            },
            index: 2,
            icon: Icons.clear,
            text: 'Logout',
            lastIcon: Icons.logout_rounded,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
