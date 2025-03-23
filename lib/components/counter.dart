import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final void Function() decreaseCount;
  final void Function() increaseCount;
  final int counter;
  const Counter({
    super.key,
    required this.decreaseCount,
    required this.increaseCount,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        InkWell(
          onTap: () => decreaseCount(),
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Icon(
              size: 18,
              color: Colors.grey.shade700,
              Icons.remove,
            ),
          ),
        ),
        Text(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.grey.shade700,
          ),
          '$counter',
        ),
        InkWell(
          onTap: () => increaseCount(),
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Icon(
              size: 18,
              color: Colors.grey.shade700,
              Icons.add,
            ),
          ),
        ),
      ],
    );
  }
}
