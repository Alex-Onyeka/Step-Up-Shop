import 'package:flutter/material.dart';
import 'package:shopapp/components/shoe_class.dart';

class ProductImageDisplay extends StatefulWidget {
  final ShoeClass shoe;
  const ProductImageDisplay({
    super.key,
    required this.shoe,
  });

  @override
  State<ProductImageDisplay> createState() =>
      _ProductImageDisplayState();
}

class _ProductImageDisplayState
    extends State<ProductImageDisplay> {
  int mainImage = 0;
  int firstImage = 1;
  int secondImage = 2;
  int thirdImage = 3;
  int lastClicked = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.maxFinite,
      child: Row(
        spacing: 15,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              key: Key('one'),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(10),
              ),
              height: double.maxFinite,

              child: Image.asset(
                widget.shoe.imagePath[mainImage],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              spacing: 15,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        mainImage = 1;
                        firstImage = 0;
                        secondImage = 2;
                        thirdImage = 3;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      key: Key('two'),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Image.asset(
                        widget.shoe.imagePath.length < 2
                            ? 'lib/images/error.png'
                            : widget
                                .shoe
                                .imagePath[firstImage],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        mainImage = 2;
                        secondImage = 0;
                        firstImage = 1;
                        thirdImage = 3;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      key: Key('three'),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Image.asset(
                        widget.shoe.imagePath.length < 3
                            ? 'lib/images/error.png'
                            : widget
                                .shoe
                                .imagePath[secondImage],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        mainImage = 3;
                        thirdImage = 0;
                        secondImage = 2;
                        firstImage = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      key: Key('four'),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Image.asset(
                        widget.shoe.imagePath.length < 4
                            ? 'lib/images/error.png'
                            : widget
                                .shoe
                                .imagePath[thirdImage],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
