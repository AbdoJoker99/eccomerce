import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api_manger.dart';
import 'login_states.dart';

class loginCubit extends Cubit<loginStates> {
  loginCubit() : super(loginInitialState());

  // Form key to validate the login form
  static final formKey = GlobalKey<FormState>();

  // Controllers for email and password input fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Method to handle the login logic
  void Login() async {
    if (!formKey.currentState!.validate()) {
      // If form is invalid, do not proceed with login
      return;
    }

    try {
      emit(loginLoadingState());

      // Making API call for login
      var response = await ApiManager.login(
        emailController.text,
        passwordController.text,
      );

      // Check if the response indicates a failure
      if (response.statusMsg == 'fail') {
        emit(
            loginErrorState(errorMessage: response.message ?? 'Unknown error'));
      } else {
        // If successful, emit success state
        emit(loginSuccessState(response: response));
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      emit(loginErrorState(errorMessage: e.toString()));
    }
  }
}
