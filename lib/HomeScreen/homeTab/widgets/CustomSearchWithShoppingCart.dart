import 'package:flutter/material.dart';

import '../../Productlist/cubit/ProductViewmodel.dart';
import '../../cart_screen/cart_screen.dart';

class CustomSearchWithShoppingCart extends StatefulWidget {
  const CustomSearchWithShoppingCart({Key? key}) : super(key: key);

  @override
  State<CustomSearchWithShoppingCart> createState() =>
      _CustomSearchWithShoppingCartState();
}

class _CustomSearchWithShoppingCartState
    extends State<CustomSearchWithShoppingCart> {
  ProductViewModel viewModel = ProductViewModel();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "what do you search for?",
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              child: Badge(
                child: Icon(Icons.shopping_cart),
              ),
            )),
      ],
    );
  }
}
