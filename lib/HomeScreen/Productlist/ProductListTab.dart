// Assuming you have a ProductCubit
import 'package:ecomm/HomeScreen/Productlist/cubit/ProductState.dart';
import 'package:ecomm/HomeScreen/Productlist/cubit/ProductViewmodel.dart';
import 'package:ecomm/HomeScreen/Productlist/widgets/prodect_description/Grid_View_Card_Item.dart';
import 'package:ecomm/homescreen/productlist/widgets/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../homeTab/widgets/CustomSearchWithShoppingCart.dart';

class Productlisttab extends StatefulWidget {
  static const String routeName = 'product';

  Productlisttab({super.key});

  @override
  State<Productlisttab> createState() => ProductlisttabState();
}

class ProductlisttabState extends State<Productlisttab> {
  ProductViewModel viewModel = ProductViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductViewModel, Productstate>(
      bloc: viewModel..getAllProducts(), // Fetch products
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Image.asset("assets/images/logo.png"),
                SizedBox(height: 10.h),
                CustomSearchWithShoppingCart(),
                SizedBox(height: 10.h),

                // Check if productList is null or empty
                if (viewModel.productList == null)
                  Expanded(
                    child: Center(
                      child:
                          CircularProgressIndicator(), // Show loading while fetching data
                    ),
                  )
                else if (viewModel.productList!.isEmpty)
                  Expanded(
                    child: Center(
                      child: Text(
                        'No products available',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: GridView.builder(
                      itemCount: viewModel.productList!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 15.w,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ProductDescription.routeName,
                            );
                          },
                          child: GridViewCardItem(
                            product: viewModel.productList![index],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
