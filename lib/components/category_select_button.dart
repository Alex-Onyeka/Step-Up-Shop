import 'package:flutter/material.dart';

class CategorySelectButton extends StatelessWidget {
  final String title;
  final String currentCategory;
  final void Function()? onTap;

  const CategorySelectButton({
    super.key,
    required this.title,
    this.onTap,
    required this.currentCategory,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color:
              currentCategory == title.toLowerCase()
                  ? Colors.grey.shade200
                  : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
            ),
            title,
          ),
        ),
      ),
    );
  }
}
