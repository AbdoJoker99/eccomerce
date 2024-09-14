import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatefulWidget {
  final String title;
  final String imageUrl;
  final double price;
  final int initialCount;

  CartItem({
    required this.title,
    required this.imageUrl,
    required this.price,
    this.initialCount = 1,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int count = 1;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  void _incrementCount() {
    setState(() {
      count++;
    });
  }

  void _decrementCount() {
    if (count > 1) {
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 145.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ), // BoxDecoration
            child: Image.asset("assets/images/music.png"),
          ), // Container

          SizedBox(width: 10),

          // Title and Count
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "titel",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        // Delete item action
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text('color:'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' EGP price',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                      width: 15,
                    ),
                    IconButton(
                      onPressed: _decrementCount,
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                    Text(count.toString()),
                    IconButton(
                      onPressed: _incrementCount,
                      icon: Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Price
        ],
      ),
    );
  }
}
