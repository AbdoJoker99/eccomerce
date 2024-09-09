import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api_manger.dart';
import 'login_states.dart';

class loginCubit extends Cubit<loginStates> {
  loginCubit() : super(loginInitialState());

  //String errorMessage;
  //todo: hold data - handle logic
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void Login() async {
    try {
      emit(loginLoadingState());
      var response = await ApiManager.login(
        emailController.text,
        passwordController.text,
      );

      if (response.statusMsg == 'fail') {
        emit(loginErrorState(errorMessage: response.message!));
      } else {
        emit(loginSuccessState(response: response));
      }
    } catch (e) {
      emit(loginErrorState(errorMessage: e.toString()));
    }
  }
}
