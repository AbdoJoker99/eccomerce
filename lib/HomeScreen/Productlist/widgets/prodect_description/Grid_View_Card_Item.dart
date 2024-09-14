import 'package:ecomm/Data/model/response/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewCardItem extends StatefulWidget {
  Product product;
  GridViewCardItem({required this.product});

  @override
  State<GridViewCardItem> createState() => _GridViewCardItemState();
}

class _GridViewCardItemState extends State<GridViewCardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Stack(
            children: [
              Image.network(
                widget.product.imageCover ??
                    "", // Replace with actual image URL
                height: 100.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 2,
                right: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle, // To make the container circular
                    border: Border.all(
                      color: Colors.white, // White border
                      width: 0.5, // Border width
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.blue, // Icon color
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "EGP ${widget.product.price}", // Product price
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "${widget.product.ratingsAverage}", // Number of reviews
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "${widget.product.ratingsQuantity}", // Number of reviews
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    // Increment button
                    ElevatedButton(
                      onPressed: () {
                        // Increment logic here
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                      ),
                      child:
                          Icon(Icons.add), // Use Icon widget for the add icon
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
