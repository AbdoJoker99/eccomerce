// Assuming you have a ProductCubit
import 'package:ecomm/HomeScreen/Productlist/cubit/ProductState.dart';
import 'package:ecomm/HomeScreen/Productlist/cubit/ProductViewmodel.dart';
import 'package:ecomm/HomeScreen/Productlist/widgets/prodect_description/Grid_View_Card_Item.dart';
import 'package:ecomm/homescreen/homeTab/widgets/CustomSearchWithShoppingCart.dart';
import 'package:ecomm/homescreen/productlist/widgets/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Data/model/response/ProductResponse.dart';

class Productlisttab extends StatefulWidget {
  static const String routeName = 'product';
  Product? product;
  Productlisttab({super.key});

  @override
  State<Productlisttab> createState() => ProductlisttabState();
}

class ProductlisttabState extends State<Productlisttab> {
  ProductViewModel viewModel = ProductViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getAllProducts(),
      child: BlocConsumer<ProductViewModel, Productstate>(
        listener: (context, state) {
          if (state is addCartTabSuccsesState) {
            // You can show a success message if required

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Product added to cart!')),
            );
          }
        },
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
                  if (viewModel.productList == null)
                    Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
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
                                arguments: viewModel.productList![index],
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
      ),
    );
  }
}
