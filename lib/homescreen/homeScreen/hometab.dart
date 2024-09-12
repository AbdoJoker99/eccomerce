import 'package:ecomm/homescreen/homeScreen/widgets/AnnouncementsSection.dart';
import 'package:ecomm/homescreen/homeScreen/widgets/CategoriesOrBrandsSection.dart';
import 'package:ecomm/homescreen/homeScreen/widgets/CustomSearchWithShoppingCart.dart';
import 'package:ecomm/homescreen/homeScreen/widgets/RowSectionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hometab extends StatefulWidget {
  const Hometab({super.key});

  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ), // SizedBox
              Image.asset('assets/images/logo.png'),
              SizedBox(
                height: 18.h,
              ), // SizedBox
              CustomSearchWithShoppingCart(),
              SizedBox(
                height: 16.h,
              ),
              AnnouncementsSection(),
              SizedBox(
                height: 16.h,
              ),
              RowSectionWidget(name: 'Categories'),
              SizedBox(
                height: 24.h,
              ),
              CategoriesOrBrandsSection(),
              SizedBox(
                height: 16.h,
              ),
              RowSectionWidget(name: 'Brands'),
              SizedBox(
                height: 24.h,
              ),
              CategoriesOrBrandsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
