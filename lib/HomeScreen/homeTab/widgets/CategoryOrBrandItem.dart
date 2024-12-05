import 'package:ecomm/Data/model/response/categoryOrBrandResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_colors.dart';

class CategoryOrBrandItem extends StatefulWidget {
  CategoryOrBrand categoryOrBrand; // Final since it's being passed through constructor

  CategoryOrBrandItem({required this.categoryOrBrand});

  @override
  State<CategoryOrBrandItem> createState() => _CategoryOrBrandItemState();
}

class _CategoryOrBrandItemState extends State<CategoryOrBrandItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.categoryOrBrand.image ??
                ""), // Use the imageUrl field from Category model
            radius: 50.r,
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
          flex: 2,
          child: Text(
            widget.categoryOrBrand.name ?? "", // Display the name from Category model
            textWidthBasis: TextWidthBasis.longestLine,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
      ],
    );
  }
}
