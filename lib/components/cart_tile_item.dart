import 'package:flutter/material.dart';
import 'package:shopapp/components/counter.dart';
import 'package:shopapp/components/shoe_class.dart';

class CartTileItem extends StatefulWidget {
  final ShoeClass cartItem;
  final void Function()? delete;

  const CartTileItem({
    super.key,
    required this.cartItem,
    required this.delete,
  });

  @override
  State<CartTileItem> createState() => _CartTileItemState();
}

class _CartTileItemState extends State<CartTileItem> {
  //
  //
  int counter = 1;
  //
  //
  void increaseCount() {
    setState(() {
      counter++;
    });
  }

  //
  //
  void decreaseCount() {
    setState(() {
      counter < 2 ? counter = 1 : counter--;
    });
  }

  //
  //
  //

  //
  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),

      child: Column(
        spacing: 5,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                spacing: 15,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 90,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade100,
                      ),
                      borderRadius: BorderRadius.circular(
                        3,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      widget.cartItem.imagePath[0],
                    ),
                  ),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        widget.cartItem.name,
                      ),
                      Text(
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                        widget.cartItem.description,
                      ),
                      Row(
                        children: [
                          Text(
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                            'Size: ',
                          ),
                          Text(
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold,
                            ),
                            'XXL',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 10.0,
                  bottom: 5,
                ),
                child: Text(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey.shade800,
                  ),
                  '\$${widget.cartItem.price}',
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey.shade200,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                spacing: 15,
                children: [
                  InkWell(
                    onTap: () => widget.delete?.call(),
                    child: Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Counter(
                      decreaseCount: () => decreaseCount(),
                      increaseCount: () => increaseCount(),
                      counter: counter,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
