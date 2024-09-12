import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_colors.dart';

class CategoryOrBrandItem extends StatelessWidget {
  //todo: category OrBrand model
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/jhoonydeep.jpg"),
            radius: 50.r,
          ),
        ),
        SizedBox(
          height: 8.h,
        ), // SizedBox
        Expanded(
          flex: 2,
          child: Text(
            "name",
            textWidthBasis: TextWidthBasis.longestLine,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                ),
          ), // CircleAvatar
        ), // Expanded
      ],
    );
  }
}
