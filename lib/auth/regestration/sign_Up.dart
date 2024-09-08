import 'package:ecomm/auth/regestration/cubit/Register_cubit.dart';
import 'package:ecomm/auth/regestration/cubit/redister_states.dart';
import 'package:ecomm/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_colors.dart';
import '../../data/api_manger.dart';
import '../custom_text_form-field.dart';

class Signup extends StatefulWidget {
  static const String routeName = 'register_screen';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  RegisterCubit cubit = RegisterCubit();

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
                                label: 'enter your full name',
                                controller: cubit.nameController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "please enter your name";
                                  }
                                  return null;
                                },
                                obscureText: false,
                                feildName: 'Full Name',
                              ),
                              CustomTextFormField(
                                label: 'enter your mobile number',
                                controller: cubit.mobileNumberController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "please enter your mobile number";
                                  }
                                  return null;
                                },
                                obscureText: false,
                                feildName: 'Mobile number',
                              ),
                              CustomTextFormField(
                                label: 'enter your email',
                                controller: cubit.emailController,
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
                              ),
                              CustomTextFormField(
                                label: 'password',
                                controller: cubit.passwordController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "please enter your password";
                                  }
                                  if (text.length < 6) {
                                    return "password cannot be less than 6 characters";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                feildName: 'password',
                              ),
                              CustomTextFormField(
                                label: 'confirm password',
                                controller: cubit.confirmPasswordController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return "please enter confirm password";
                                  }
                                  if (text.length < 6) {
                                    return "password cannot be less than 6 characters";
                                  }
                                  if (text != cubit.passwordController.text) {
                                    return "confirm password does not match try again!";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                feildName: 'Confirm password',
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                  onPressed: () {
                                    register();
                                  },
                                  child: Text(
                                    'SignUp',
                                    style: TextStyle(color: Colors.blueAccent),
                                  ),
                                ),
                              )
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

  void register() async {
    if (cubit.formKey.currentState?.validate() == true) {
      try {
        cubit.emit(RegisterLoadingState());
        var response = await ApiManager.register(
          cubit.emailController.text,
          cubit.nameController.text,
          cubit.mobileNumberController.text,
          cubit.passwordController.text,
          cubit.confirmPasswordController.text,
        );
        if (response.statusMsg == 'fail') {
          cubit.emit(RegisterErrorState(
              errorMessage: response.message ?? response.message!));
        } else {
          cubit.emit(RegisterSuccessState(response: response));
        }
      } catch (e) {
        // Log the error or display a user-friendly error message
        print('Error registering user: $e');
        cubit.emit(RegisterErrorState(errorMessage: e.toString()));
      }
    }
  }
}
