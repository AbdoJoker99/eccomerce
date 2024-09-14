import 'package:ecomm/auth/regestration/cubit/Register_cubit.dart';
import 'package:ecomm/auth/regestration/cubit/redister_states.dart';
import 'package:ecomm/dialog_utils.dart';
import 'package:ecomm/homescreen/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_colors.dart';
import '../custom_text_form-field.dart';

class Signup extends StatefulWidget {
  static const String routeName = 'register_screen';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  RegisterCubit cubit = RegisterCubit(); // Create an instance of RegisterCubit
  bool _obscureText = true; // For controlling password visibility

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoading(context, 'Loading...');
          } else if (state is RegisterErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              content: state.errorMessage,
            );
          } else if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              content: 'Registration successful!',
            );
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          }
        },
        child: Scaffold(
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Form(
                          key: cubit.formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                label: 'Enter your full name',
                                controller: cubit.nameController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "Please enter your name";
                                  }
                                  return null;
                                },
                                obscureText: false,
                                feildName: 'Full Name',
                              ),
                              CustomTextFormField(
                                label: 'Enter your mobile number',
                                controller: cubit.mobileNumberController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "Please enter your mobile number";
                                  }
                                  return null;
                                },
                                obscureText: false,
                                feildName: 'Mobile Number',
                              ),
                              CustomTextFormField(
                                label: 'Enter your email',
                                controller: cubit.emailController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "Please enter your email";
                                  }
                                  final bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(text);
                                  if (!emailValid) {
                                    return "Please enter a valid email";
                                  }
                                  return null;
                                },
                                obscureText: false,
                                feildName: 'Email Address',
                              ),
                              CustomTextFormField(
                                label: 'Password',
                                controller: cubit.passwordController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "Please enter your password";
                                  }
                                  if (text.length < 6) {
                                    return "Password cannot be less than 6 characters";
                                  }
                                  return null;
                                },
                                feildName: 'Password',
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
                                label: 'Confirm Password',
                                controller: cubit.confirmPasswordController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "Please enter confirm password";
                                  }
                                  if (text.length < 6) {
                                    return "Password cannot be less than 6 characters";
                                  }
                                  if (text != cubit.passwordController.text) {
                                    return "Confirm password does not match!";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                feildName: 'Confirm Password',
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                  ),
                                  onPressed: () {
                                    if (cubit.formKey.currentState
                                            ?.validate() ==
                                        true) {
                                      cubit
                                          .register(); // Trigger registration on valid form
                                    }
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(color: Colors.blueAccent),
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
        ),
      ),
    );
  }
}
