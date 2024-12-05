import 'package:ecomm/Data/model/failures.dart';

import '../../../Data/model/response/getProductCartResponse.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartErrorState extends CartStates {
  Failures errors;
  GetCartErrorState({required this.errors});
}

class GetCartSuccessState extends CartStates {
  GetProductCartResponse getCartResponse;
  GetCartSuccessState({required this.getCartResponse});
}

class DeleteCartLoadingState extends CartStates {}

class DeleteCartErrorState extends CartStates {
  Failures errors;
  DeleteCartErrorState({required this.errors});
}

class DeleteCartSuccessState extends CartStates {
  GetProductCartResponse getCartResponse;
  DeleteCartSuccessState({required this.getCartResponse});
}

class UpdateCartLoadingState extends CartStates {}

class UpdateCartErrorState extends CartStates {
  Failures errors;
  UpdateCartErrorState({required this.errors});
}

class UpdateCartSuccessState extends CartStates {
  GetProductCartResponse getCartResponse;
  UpdateCartSuccessState({required this.getCartResponse});
}
