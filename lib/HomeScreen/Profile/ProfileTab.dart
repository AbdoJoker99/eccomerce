import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_colors.dart';
import '../../auth/custom_text_form-field.dart';

class Profiletab extends StatefulWidget {
  static const String routeName = 'profile';

  @override
  _ProfiletabState createState() => _ProfiletabState();
}

class _ProfiletabState extends State<Profiletab> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.whiteColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                child: Image.asset('assets/images/logo.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Name",
                      style: TextStyle(
                          color: AppColors.backgroundDarkColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "abdo@gmail.com",
                        style: TextStyle(color: AppColors.backgroundDarkColor),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        label: 'enter your full name',
                        controller: nameController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "please enter your name";
                          }
                          return null;
                        },
                        obscureText: false,
                        feildName: 'Full Name',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Handle edit action
                          },
                        ),
                      ),
                      CustomTextFormField(
                        label: 'enter your mobile number',
                        controller: mobileNumberController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "please enter your mobile number";
                          }
                          return null;
                        },
                        obscureText: false,
                        feildName: 'Mobile number',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Handle edit action
                          },
                        ),
                      ),
                      CustomTextFormField(
                        label: 'enter your email',
                        controller: emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "please enter your email";
                          }
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_^{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return "please enter valid email";
                          }
                          return null;
                        },
                        obscureText: false,
                        feildName: 'E-mail address',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Handle edit action
                          },
                        ),
                      ),
                      CustomTextFormField(
                        label: 'password',
                        controller: passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "please enter your password";
                          }
                          if (text.length < 6) {
                            return "password cannot be less than 6 characters";
                          }
                          return null;
                        },
                        feildName: 'password',
                        obscureText: _obscureText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      CustomTextFormField(
                        label: 'confirm password',
                        controller: confirmPasswordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "please enter confirm password";
                          }
                          if (text.length < 6) {
                            return "password cannot be less than 6 characters";
                          }
                          if (text != passwordController.text) {
                            return "confirm password does not match try again!";
                          }
                          return null;
                        },
                        obscureText: true,
                        feildName: 'Confirm password',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Handle edit action
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
