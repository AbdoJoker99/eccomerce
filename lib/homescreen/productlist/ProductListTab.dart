import 'package:ecomm/homescreen/productlist/widgets/prodect_description/Grid_View_Card_Item.dart';
import 'package:ecomm/homescreen/productlist/widgets/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../homeScreen/widgets/CustomSearchWithShoppingCart.dart';

class Productlisttab extends StatelessWidget {
  static const String routeName = 'product';
  const Productlisttab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Image.asset("assets/images/logo.png"),
            SizedBox(
              height: 10.h,
            ),
            CustomSearchWithShoppingCart(),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 15,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 15.w,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(ProductDescription.routeName);
                      },
                      child: GridViewCardItem(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
