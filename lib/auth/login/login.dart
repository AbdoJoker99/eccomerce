import 'package:ecomm/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../homescreen/home_Screen.dart';
import '../custom_text_form-field.dart';
import '../regestration/sign_Up.dart';

class Login extends StatefulWidget {
  static const String routeName = 'login_screen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                child: Image.asset('assets/images/route.png'),
              ),
              Positioned(
                left: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Welcome back to route",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Text(
                  "please sign in with your email",
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            feildName: "UserName",
                            label: 'Email',
                            controller: _emailController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please enter your email";
                              }
                              final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_^{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(text);
                              if (!emailValid) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                            obscureText: false,
                          ),
                          CustomTextFormField(
                            feildName: "Password",
                            label: 'Password',
                            controller: _passwordController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please enter your password";
                              }
                              if (text.length < 6) {
                                return "Password cannot be less than 6 characters";
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(HomeScreen.routeName);
                              },
                              child: const Text('Login',
                                  style: TextStyle(color: Colors.blueAccent)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(Signup.routeName);
                              },
                              child: const Text(
                                'Don’t have an account? Create Account',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
