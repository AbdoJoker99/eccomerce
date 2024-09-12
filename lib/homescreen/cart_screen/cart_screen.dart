import 'package:flutter/material.dart';

import 'CartItem.dart';
import 'CheckoutRow.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "cart";
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Apply padding to the overall screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Spacing between items
                    child: CartItem(
                      title: 'Item Title $index',
                      imageUrl: "assets/images/music.png",
                      price: 100.0, // Example price, replace with actual value
                    ),
                  );
                },
                itemCount: 5, // Example item count, adjust as needed
              ),
            ),
            const CheckoutRow(),
          ],
        ),
      ),
    );
  }
}
