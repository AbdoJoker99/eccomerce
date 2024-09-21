import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../homeTab/widgets/CustomSearchWithShoppingCart.dart';
import 'favoriteCartItem.dart';

class Favoritetab extends StatefulWidget {
  static const String routeName = 'favorite';
  const Favoritetab({super.key});

  @override
  State<Favoritetab> createState() => _FavoritetabState();
}

class _FavoritetabState extends State<Favoritetab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Apply padding to the overall screen
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Image.asset('assets/images/logo.png'),
              SizedBox(height: 18.h),
              CustomSearchWithShoppingCart(),
              SizedBox(height: 16.h),

              // Define the height of the ListView.builder
              SizedBox(
                height: 850.h, // Set a specific height for the ListView
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0), // Spacing between items
                      child: FavoriteCartItem(
                        title: 'Item Title $index',
                        imageUrl: "assets/images/music.png",
                        price:
                            100.0, // Example price, replace with actual value
                      ),
                    );
                  },
                  itemCount: 5, // Example item count, adjust as needed
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
