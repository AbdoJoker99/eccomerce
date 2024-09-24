import '../../../data/model/response/login_Response.dart';

abstract class loginStates {}

class loginInitialState extends loginStates {}

class loginLoadingState extends loginStates {}

class loginErrorState extends loginStates {
  final String errorMessage;

  loginErrorState({required this.errorMessage});
}

class loginSuccessState extends loginStates {
  final LoginResponse response;

  loginSuccessState({required this.response});
}
