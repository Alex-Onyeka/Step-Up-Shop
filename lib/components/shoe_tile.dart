import 'package:flutter/material.dart';
import 'package:shopapp/components/shoe_class.dart';

class ShowTile extends StatefulWidget {
  final ShoeClass shoe;
  final void Function()? onTap;
  const ShowTile({
    super.key,
    required this.shoe,
    required this.onTap,
  });

  @override
  State<ShowTile> createState() => _ShowTileState();
}

class _ShowTileState extends State<ShowTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            spacing: 15,
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 15,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 70,
                    width: 70,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      border: Border.all(
                        color: Colors.grey.shade100,
                        width: 1,
                      ),
                    ),
                    child: Image.asset(
                      widget.shoe.imagePath[0],
                    ),
                  ),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        widget.shoe.name,
                      ),
                      Text(
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 13,
                        ),
                        widget.shoe.category,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    '\$${widget.shoe.price}',
                  ),
                  Text(
                    style: TextStyle(
                      decoration:
                          TextDecoration.lineThrough,
                      color: Colors.grey.shade700,
                      fontSize: 13,
                    ),
                    '\$${widget.shoe.discount}',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
