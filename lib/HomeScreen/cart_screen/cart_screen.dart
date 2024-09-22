import 'package:ecomm/HomeScreen/cart_screen/cubit/cartViewModel.dart';
import 'package:ecomm/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CartItem.dart';
import 'CheckoutRow.dart';
import 'cubit/cartState.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "cart";
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cartviewmodel viewmodel = Cartviewmodel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewmodel..getCart(),
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Cart",
              style: TextStyle(color: Colors.blue),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
            ],
          ),
          body: BlocBuilder<Cartviewmodel, cartstate>(
            bloc: Cartviewmodel.get(context)..getCart(),
            builder: (BuildContext context, state) {
              state is getCartTabSuccsesState
                  ? Column(
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
                                  price:
                                      100.0, // Example price, replace with actual value
                                ),
                              );
                            },
                            itemCount:
                                5, // Example item count, adjust as needed
                          ),
                        ),
                        const CheckoutRow(),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ));
            },
          ),
        );
      },
    );
  }
}
