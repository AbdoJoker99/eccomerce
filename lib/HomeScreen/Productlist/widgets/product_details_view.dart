import 'package:ecomm/Data/model/response/ProductResponse.dart';
import 'package:ecomm/app_colors.dart';
import 'package:ecomm/homescreen/productlist/widgets/size&color/ColorButton.dart';
import 'package:ecomm/homescreen/productlist/widgets/size&color/SizeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the image_slideshow package

class ProductDescription extends StatefulWidget {
  static const String routeName = "desc";
  const ProductDescription({super.key});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  Color selectedColor = Colors.brown; // Default selected color

  // List of available colors
  final List<Color> colors = [
    Colors.brown,
    Colors.blue,
    Colors.green,
    Colors.red,
  ];
  String selectedSize = 'M'; // Default selected size

  // List of available sizes
  final List<String> sizes = [
    'S',
    'M',
    'L',
  ];
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Product Details",
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 400.h, // Adjust height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ImageSlideshow(
                  width: double.infinity,
                  height: 300.h,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  children: args.images!
                      .map(
                        (url) => Image.network(
                          url,
                          fit: BoxFit.cover,
                          height: 300.h,
                          width: double.infinity,
                        ),
                      )
                      .toList(),
                  onPageChanged: (value) {
                    print('Page changed: $value');
                  },
                  autoPlayInterval: 3000,
                  isLoop: true,
                ),
              ),
              SizedBox(height: 20.h),
              // Add more widgets here like product description, price, etc.
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Title",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 24,
                          ),
                    ),
                  ),
                  Text(
                    "EGP 2000",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 24,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Space between elements
                children: [
                  // "Sold" text
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text('Sold'),
                  ),
                  SizedBox(width: 8.w), // Spacing between elements
                  // Star rating and reviews
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(
                        'avg_rating',
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                  // Quantity control
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove, color: AppColors.primaryColor),
                        color: Colors.blue,
                        iconSize: 20,
                        padding: EdgeInsets.all(8),
                        constraints: BoxConstraints(),
                      ),
                      Text(
                        '1',
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add, color: AppColors.primaryColor),
                        color: Colors.blue,
                        iconSize: 20,
                        padding: EdgeInsets.all(8),
                        constraints: BoxConstraints(),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    ' Description in  details',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
              SizedBox(height: 8.h),

              // Size section
              Text(
                'Size',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8.h),
              Row(
                children: sizes.map((size) {
                  return SizeButton(
                    size: size,
                    selected: selectedSize == size,
                    onTap: () {
                      setState(() {
                        selectedSize = size; // Update the selected size
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 16),

              // Color section
              Text(
                'Color',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 8),
              Row(
                children: colors.map((color) {
                  return ColorButton(
                    color: color,
                    selected: selectedColor == color,
                    onTap: () {
                      setState(() {
                        selectedColor = color; // Update the selected color
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Total price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total price',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      Text(
                        'EGP 3,500',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),

                  // Add to cart button
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Add to cart'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
