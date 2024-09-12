import 'package:ecomm/auth/regestration/cubit/redister_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api_manger.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  // Form key to validate the form
  final formKey = GlobalKey<FormState>();

  // Controllers for text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // To toggle password visibility
  bool isObscure = true;

  // Method to handle registration logic
  void register() async {
    if (!formKey.currentState!.validate()) {
      // If the form is not valid, do not proceed
      return;
    }

    try {
      emit(RegisterLoadingState());

      // Registering the user with API
      var response = await ApiManager.register(
        nameController.text,
        emailController.text,
        passwordController.text,
        mobileNumberController.text,
        confirmPasswordController.text,
      );

      // Check if the response indicates failure
      if (response.statusMsg == 'fail') {
        emit(RegisterErrorState(
            errorMessage: response.message ?? 'Unknown error'));
      } else {
        // If successful, emit success state with the response
        emit(RegisterSuccessState(response: response));
      }
    } catch (e) {
      // Emit error state if something goes wrong
      emit(RegisterErrorState(errorMessage: e.toString()));
    }
  }
}
