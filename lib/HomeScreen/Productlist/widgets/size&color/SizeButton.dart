// SizeButton widget with onTap callback
import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  final String size;
  final bool selected;
  final VoidCallback onTap;

  SizeButton({required this.size, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: onTap, // Call the provided onTap function when clicked
        style: ElevatedButton.styleFrom(
          backgroundColor: selected ? Colors.blue : Colors.grey[200],
          shape: CircleBorder(),
          padding: EdgeInsets.all(12),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
