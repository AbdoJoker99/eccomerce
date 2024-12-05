import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteCartItem extends StatefulWidget {
  final String imageUrl;
  final double price;
  final int initialCount;
  final String title;
  FavoriteCartItem(
      {required this.imageUrl,
      required this.price,
      this.initialCount = 1,
      required,
      required this.title});

  @override
  _FavoriteCartItemState createState() => _FavoriteCartItemState();
}

class _FavoriteCartItemState extends State<FavoriteCartItem> {
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
            height: 120.h, // Adjusted for smaller screens
            width: 120.w, // Adjusted for smaller screens
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.asset(widget.imageUrl, fit: BoxFit.cover),
          ),

          SizedBox(width: 10.w), // Responsive spacing

          // Title and Count
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      // This allows the text to be responsive
                      child: Text(
                        'Title',
                        style: TextStyle(
                          fontSize: 16.sp, // Make text responsive
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis, // Handle long text
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Delete item action
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text('Color:'),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EGP ${widget.price}',
                      style: TextStyle(
                        fontSize: 16.sp, // Make text responsive
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add your checkout action here
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Add To Cart',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(width: 5.w), // Small space
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
