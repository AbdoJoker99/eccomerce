import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Data/model/response/categoryOrBrandResponse.dart';
import 'CategoryOrBrandItem.dart';

class CategoriesOrBrandsSection extends StatefulWidget {
  List<CategoryOrBrand> categoriesList;

  CategoriesOrBrandsSection({required this.categoriesList});
  @override
  State<CategoriesOrBrandsSection> createState() =>
      _CategoriesOrBrandsSectionState();
}

class _CategoriesOrBrandsSectionState extends State<CategoriesOrBrandsSection> {
  // Fixed the missing semicolon
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
        itemCount:
            widget.categoriesList.length, // Use the actual length of the list
        itemBuilder: (context, index) {
          return CategoryOrBrandItem(
            categoryOrBrand: widget.categoriesList[index],
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
      ),
    );
  }
}
