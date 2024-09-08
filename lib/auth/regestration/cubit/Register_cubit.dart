import 'package:ecomm/auth/regestration/cubit/redister_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api_manger.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  //String errorMessage;
  //todo: hold data - handle logic
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isobscure = true;
  void register() async {
    try {
      emit(RegisterLoadingState());
      var response = await ApiManager.register(
          emailController.text,
          nameController.text,
          mobileNumberController.text,
          passwordController.text,
          confirmPasswordController.text);
      if (response.statusMsg == 'fail') {
        emit(RegisterErrorState(errorMessage: response.message!));
      } else {
        emit(RegisterSuccessState(response: response));
      }
    } catch (e) {
      emit(RegisterErrorState(errorMessage: e.toString()));
    }
  }
}
