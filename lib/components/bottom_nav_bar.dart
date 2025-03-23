import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      onTabChange: (index) {
        onTabChange!(index);
      },
      tabMargin: EdgeInsets.only(top: 15, bottom: 5),
      color: Colors.grey,
      activeColor: Colors.grey.shade800,
      mainAxisAlignment: MainAxisAlignment.center,
      padding: EdgeInsets.all(20),
      tabActiveBorder: Border.all(
        color: Colors.grey.shade100,
      ),
      backgroundColor: const Color.fromARGB(
        255,
        238,
        238,
        238,
      ),
      gap: 10,
      tabBackgroundColor: Colors.white,
      tabs: [
        GButton(icon: Icons.menu_outlined, text: 'My Shop'),
        GButton(
          icon: Icons.shopping_cart_outlined,
          text: 'Cart',
        ),
      ],
    );
  }
}
