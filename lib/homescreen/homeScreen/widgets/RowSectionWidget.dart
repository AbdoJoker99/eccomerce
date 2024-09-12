import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_colors.dart';

class RowSectionWidget extends StatelessWidget {
  final String name; // Declare a class-level variable

  const RowSectionWidget(
      {required this.name}); // Initialize it in the constructor

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name, // Now you can use the class-level variable
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
        ),
        InkWell(
          // Fix: Inkwell -> InkWell
          onTap: () {},
          child: Text(
            'View All',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
          ), // Text
        ),
      ],
    );
  }
}
