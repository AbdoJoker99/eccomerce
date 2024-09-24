import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_colors.dart';
import 'CartItem.dart';
import 'cubit/cartState.dart';
import 'cubit/cartViewModel.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = 'cart_screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartViewModel()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text('Product Details'),
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primaryColor,
          titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold),
          actions: [
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              icon: Icon(Icons.search),
            ),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.shopping_cart_checkout_outlined))
          ],
        ),
        body: BlocBuilder<CartViewModel, CartStates>(
          builder: (context, state) {
            if (state is GetCartSuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CartItem(
                        productCart:
                            state.getCartResponse.data!.products![index],
                      );
                    },
                    itemCount: state.getCartResponse.data!.products!.length,
                  )),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 98.h, left: 16.w, right: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: Text(
                                'Total Price',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: AppColors.backgroundDarkColor),
                              ),
                            ),
                            Text(
                              'EGP ${state.getCartResponse.data!.totalCartPrice}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            // Implement your checkout logic here
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 24.w),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              'Checkout',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
