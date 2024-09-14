import 'package:ecomm/HomeScreen/homeTab/HomeTabViewModel/HomeTabScreen.dart';
import 'package:ecomm/HomeScreen/homeTab/HomeTabViewModel/HomeTabViewModel.dart';
import 'package:ecomm/app_colors.dart';
import 'package:ecomm/homescreen/homeTab/widgets/AnnouncementsSection.dart';
import 'package:ecomm/homescreen/homeTab/widgets/CategoriesOrBrandsSection.dart';
import 'package:ecomm/homescreen/homeTab/widgets/CustomSearchWithShoppingCart.dart';
import 'package:ecomm/homescreen/homeTab/widgets/RowSectionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hometab extends StatefulWidget {
  const Hometab({super.key});

  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  Hometabviewmodel viewModel = Hometabviewmodel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Hometabviewmodel, HometabscreenState>(
      bloc: viewModel
        ..getAllCategories()
        ..getAllBrands(), // Fetching categories initially
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: 18.h),
                  CustomSearchWithShoppingCart(),
                  SizedBox(height: 16.h),
                  AnnouncementsSection(),
                  SizedBox(height: 16.h),
                  RowSectionWidget(name: 'Categories'),
                  SizedBox(height: 24.h),

                  // Display loading indicator or the categories list
                  viewModel.categoriesList == null ||
                          viewModel.categoriesList!.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : CategoriesOrBrandsSection(
                          categoriesList: viewModel.categoriesList!),

                  SizedBox(height: 16.h),
                  RowSectionWidget(name: 'Brands'),
                  SizedBox(height: 24.h),

                  // You can either use the same list or adjust this to show brands instead of categories
                  viewModel.brandsList == null || viewModel.brandsList!.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : CategoriesOrBrandsSection(
                          categoriesList: viewModel.brandsList!),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
