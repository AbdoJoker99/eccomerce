import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Data/api_manger.dart';
import '../../../Data/model/response/getProductCartResponse.dart';
import 'cartState.dart';

class Cartviewmodel extends Cubit<cartstate> {
  Cartviewmodel()
      : super(getCartTabInitialstate()); // Ensure the correct initial state

  List<getProductCart>? productslist = [];

  static Cartviewmodel get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(getCartTabLoadinglstate());
    var either = await ApiManager.getProductCart();

    either.fold(
      (error) {
        print("Error adding to cart: $error"); // Log the error properly
        emit(getCartTabErrorstate(
            failures: error)); // Make sure you pass the error
      },
      (response) {
        emit(getCartTabSuccsesState(getcart: response));
      },
    );
  }
}
