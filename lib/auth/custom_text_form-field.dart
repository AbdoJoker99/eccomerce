import 'package:flutter/material.dart';

import '../app_colors.dart';

typedef MyValidator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String feildName;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final MyValidator validator;

  CustomTextFormField({
    required this.label,
    required this.feildName,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.obscureText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0, bottom: 4.0),
        child: Text(
          feildName,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextFormField(
          style: TextStyle(color: AppColors.blackColor),
          decoration: InputDecoration(
            hintText: label,
            filled: true, // Added to make the background white
            fillColor: Colors.white, // Set background color to white
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            errorMaxLines: 2,
          ),
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
        ),
      ),
    ]);
  }
}
