import 'package:flutter/material.dart';

class ColorButton extends StatefulWidget {
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  ColorButton(
      {required this.color, required this.selected, required this.onTap});

  @override
  State<ColorButton> createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: widget.onTap, // Call the provided onTap function when clicked
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
            border: widget.selected
                ? Border.all(color: Colors.blue, width: 2)
                : null,
          ),
          width: 36,
          height: 36,
          child: widget.selected
              ? Icon(Icons.check, color: Colors.white)
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
