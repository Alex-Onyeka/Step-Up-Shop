import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/components/cart_tile_item.dart';
import 'package:shopapp/components/my_drawer.dart';
import 'package:shopapp/providerClass/main_provider_class.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //
  //
  void confirmDelete(index, value) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Action'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure you want to Remove this Item from your Cart?',
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      value.removeFromCart(
                        value.cart[index],
                      );
                      Navigator.of(context).pop();
                    },
                    child: Text('Confirm'),
                  ),
                  TextButton(
                    onPressed:
                        () => Navigator.of(context).pop(),
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  //
  //
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderClass>(
      builder:
          (context, value, child) => Scaffold(
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
            body: Stack(
              children: [
                Center(
                  child: Visibility(
                    visible: value.cart.isEmpty,
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      spacing: 5,
                      children: [
                        Icon(
                          color: Colors.grey.shade700,
                          size: 50,
                          Icons.hourglass_empty_rounded,
                        ),
                        Text(
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          'Your Cart is Empty',
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: value.cart.isNotEmpty,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                        ),
                        child: Text(
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                          'Cart',
                        ),
                      ),
                      ListView.builder(
                        primary: true,
                        shrinkWrap: true,
                        itemCount: value.cart.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 20,
                                ),
                            child: CartTileItem(
                              delete:
                                  () => confirmDelete(
                                    index,
                                    value,
                                  ),
                              cartItem: value.cart[index],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            drawer: MyDrawer(),
          ),
    );
  }
}
