import 'package:ecomm/app_colors.dart';
import 'package:ecomm/auth/login/login_cubit/login_states.dart';
import 'package:ecomm/share_prefrance_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../dialog_utils.dart';
import '../../homescreen/home_Screen.dart';
import '../custom_text_form-field.dart';
import '../regestration/sign_Up.dart';
import 'login_cubit/login_cubit.dart';

class Login extends StatefulWidget {
  static const String routeName = 'login_screen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  loginCubit login = loginCubit(); // Create an instance of the LoginCubit
  bool _obscureText = true; // For controlling password visibility

  @override
  void dispose() {
    login.close(); // Clean up the BLoC
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<loginCubit, loginStates>(
      bloc: login,
      listener: (context, state) {
        if (state is loginLoadingState) {
          DialogUtils.showLoading(context, 'Waiting...');
        } else if (state is loginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.errorMessage,
          );
        } else if (state is loginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: 'Login successful!',
          );
          Navigator.of(context).pushNamed(HomeScreen.routeName);
          SharedPreferenceUtils.saveData(
              key: "token", value: state.response.token);
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
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back to Route",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
                          "Please sign in with your email",
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    key: loginCubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                          feildName: "Email",
                          label: 'Enter your email',
                          controller: login.emailController,
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
                          label: 'Enter your password',
                          controller: login.passwordController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "Please enter your password";
                            }
                            if (text.length < 6) {
                              return "Password cannot be less than 6 characters";
                            }
                            return null;
                          },
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
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: () {
                              if (loginCubit.formKey.currentState?.validate() ==
                                  true) {
                                login.Login(); // Trigger login on valid form
                              }
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(Signup.routeName);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
