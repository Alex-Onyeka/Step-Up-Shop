import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/components/product_image_display.dart';
import 'package:shopapp/components/shoe_class.dart';
import 'package:shopapp/pages/home.dart';
import 'package:shopapp/providerClass/main_provider_class.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() =>
      _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  //
  //
  //
  void showAlert(String shoeName, String price) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text('Item Added to Cart'),
          ),
          content: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              '$shoeName has been added to your cart. \$$price',
            ),
          ),
        );
      },
    );
  }

  //
  //
  //
  @override
  Widget build(BuildContext context) {
    final ShoeClass shoe =
        ModalRoute.of(context)?.settings.arguments
            as ShoeClass;
    return Consumer<ProviderClass>(
      builder:
          (context, value, child) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                'Product Details',
              ),
            ),
            //
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    primary: true,
                    children: [
                      ProductImageDisplay(shoe: shoe),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                  children: [
                                    Text(
                                      style: TextStyle(
                                        color:
                                            Colors
                                                .grey
                                                .shade800,
                                        fontSize: 23,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                      shoe.name,
                                    ),
                                    Text(
                                      style: TextStyle(
                                        color:
                                            Colors
                                                .grey
                                                .shade600,
                                      ),
                                      shoe.description,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                  children: [
                                    Text(
                                      style: TextStyle(
                                        color:
                                            Colors
                                                .grey
                                                .shade700,
                                        fontSize: 23,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                      '\$${shoe.price}',
                                    ),
                                    Text(
                                      style: TextStyle(
                                        decoration:
                                            TextDecoration
                                                .lineThrough,
                                        color:
                                            Colors
                                                .grey
                                                .shade600,
                                      ),
                                      '\$${shoe.discount}',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.center,
                              spacing: 5,
                              children: [
                                Text(
                                  style: TextStyle(
                                    color:
                                        Colors
                                            .grey
                                            .shade800,
                                    fontSize: 20,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                  'Description',
                                ),
                                Text(
                                  style: TextStyle(
                                    color:
                                        Colors
                                            .grey
                                            .shade600,
                                  ),
                                  shoe.longDescription,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Row(
                    spacing: 15,
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(25),
                        ),
                        textColor: Colors.white,
                        //textTheme: ButtonTextTheme.normal,
                        color: Colors.black,
                        height: 45,
                        minWidth: 230,
                        elevation: 0,
                        onPressed: () {
                          value.addToCart(shoe);
                          showAlert(shoe.name, shoe.price);
                        },
                        child: Text(
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          'Add to Cart',
                        ),
                      ),
                      Stack(
                        alignment: Alignment(1.5, -1.5),
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => HomePage(
                                        pageIndex: 1,
                                      ),
                                ),
                              );
                              context
                                  .read<ProviderClass>()
                                  .changeCurrentPage(1);
                            },
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                            ),
                            style: ButtonStyle(
                              padding:
                                  WidgetStatePropertyAll(
                                    EdgeInsets.all(12),
                                  ),
                              side: WidgetStatePropertyAll(
                                BorderSide(
                                  color:
                                      Colors.grey.shade300,
                                ),
                              ),
                              backgroundColor:
                                  WidgetStatePropertyAll(
                                    Colors.grey.shade200,
                                  ),
                            ),
                          ),
                          Visibility(
                            visible: value.cart.isNotEmpty,
                            child: Container(
                              height: 25,
                              width: 25,
                              padding: EdgeInsets.fromLTRB(
                                5,
                                3,
                                5,
                                5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.circular(
                                      20,
                                    ),
                              ),
                              child: Center(
                                child: Text(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight:
                                        FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  value.cart.length
                                      .toString(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
