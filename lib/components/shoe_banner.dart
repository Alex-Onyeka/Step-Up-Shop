import 'package:flutter/material.dart';
import 'package:shopapp/components/shoe_class.dart';

class ShoeBanner extends StatelessWidget {
  final ShoeClass shoe;
  const ShoeBanner({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 152,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(shoe.imagePath[0]),
          fit:
              BoxFit
                  .contain, // Ensure the image covers the container correctly
        ),
      ),
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Stack(
        children: [
          Positioned(
            bottom:
                0, // Position the widget at the bottom of the stack
            right:
                0, // Position the widget at the right of the stack
            child: SizedBox(
              height: 200,
              width: 152,
              child: Stack(
                children: [
                  // Container with a gradient background (top more transparent, bottom less transparent)
                  Container(
                    width:
                        double
                            .infinity, // Make the container take the full width
                    height:
                        double
                            .infinity, // Make the container take the full height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      gradient: LinearGradient(
                        begin:
                            Alignment
                                .topCenter, // Start from the top
                        end:
                            Alignment
                                .bottomCenter, // End at the bottom
                        colors: [
                          const Color.fromARGB(
                            0,
                            255,
                            255,
                            255,
                          ), // Top - more transparent
                          const Color.fromARGB(
                            134,
                            255,
                            255,
                            255,
                          ), // Middle - semi-transparent
                          const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ), // Bottom - less transparent
                        ],
                        stops: [
                          0.0, // First color starts at the top
                          0.7, // Middle color starts at the halfway point
                          0.9, // Last color starts at the bottom
                        ],
                      ),
                    ),
                  ),
                  // Positioned Text inside the container at the bottom-right
                  Positioned(
                    bottom:
                        10, // Slightly above the bottom edge
                    left:
                        20, // Slightly from the right edge
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth:
                            152, // Limit the width of the text to the container's width
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start, // Align text to the left
                          children: [
                            // Text widget for the Shoe Title
                            Text(
                              shoe.name,
                              softWrap:
                                  true, // Allow text to wrap if needed
                              overflow:
                                  TextOverflow
                                      .visible, // Ensure text is fully visible
                              style: TextStyle(
                                color: const Color.fromARGB(
                                  255,
                                  0,
                                  0,
                                  0,
                                ),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ), // White text color for contrast
                            ),
                            // Text widget for the Shoe Price or ID
                            Text(
                              '\$ ${shoe.price}',
                              softWrap:
                                  true, // Allow wrapping
                              overflow:
                                  TextOverflow
                                      .visible, // Ensure text is fully visible
                              style: TextStyle(
                                fontSize: 16,
                                color: const Color.fromARGB(
                                  240,
                                  0,
                                  0,
                                  0,
                                ),
                              ), // White text color for contrast
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
