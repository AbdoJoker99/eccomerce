import 'package:ecomm/HomeScreen/Productlist/cubit/ProductState.dart';
import 'package:ecomm/HomeScreen/Productlist/cubit/ProductViewmodel.dart';
import 'package:ecomm/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import this for BlocBuilder
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Data/model/response/ProductResponse.dart';

class GridViewCardItem extends StatefulWidget {
  final Product product;
  GridViewCardItem({required this.product});

  @override
  State<GridViewCardItem> createState() => _GridViewCardItemState();
}

class _GridViewCardItemState extends State<GridViewCardItem> {
  bool _isFavorited = false; // To track the favorite state

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image section
                    Stack(
                      children: [
                        Image.network(
                          widget.product.imageCover ?? "",
                          height: constraints.maxHeight * 0.3,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.error),
                        ),
                        Positioned(
                          top: 2,
                          right: 2,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isFavorited = !_isFavorited;
                              });
                            },
                            child: Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: _isFavorited
                                  ? Image.asset(
                                      'assets/images/Property 1=Variant2.png',
                                      fit: BoxFit.contain,
                                    )
                                  : Image.asset(
                                      'assets/images/Property 1=Default (1).png',
                                      fit: BoxFit.contain,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: Text(
                        widget.product.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        "EGP ${widget.product.price}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
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
                              "${widget.product.ratingsAverage}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              " (${widget.product.ratingsQuantity})",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<ProductViewModel, Productstate>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state is addCartTabLoadinglstate
                                  ? null // Disable button if loading
                                  : () {
                                      print(
                                          "Adding product to cart with ID: ${widget.product.id}");

                                      if (widget.product.id != null &&
                                          widget.product.id!.isNotEmpty) {
                                        ProductViewModel.get(context)
                                            .addToCart(widget.product.id!);

                                        print(
                                            "Product added to cart successfully");
                                      } else {
                                        print("Product ID is null or invalid");
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                              ),
                              child: state is addCartTabLoadinglstate
                                  ? CircularProgressIndicator() // Show loading indicator
                                  : Icon(
                                      Icons.add_circle_rounded,
                                      color: AppColors.primaryColor,
                                    ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
