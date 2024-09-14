import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Data/api_manger.dart';
import '../../../Data/model/response/ProductResponse.dart';
import 'ProductState.dart'; // Ensure correct import of ProductState

class ProductViewModel extends Cubit<Productstate> {
  ProductViewModel()
      : super(ProductTabInitialstate()); // Ensure the correct initial state

  List<Product>? productList;

  void getAllProducts() async {
    try {
      emit(ProductTabLoadinglstate());
      var response = await ApiManager.getAllProducts();
      print(response); // Debugging output

      if (response.statusMsg == "fail") {
        print('Error: ${response.message}');
        emit(ProductTabErrorstate(errorMessage: response.message!));
      } else {
        print('Products fetched: ${response.data}');
        productList = response.data ?? [];
        emit(ProductTabSuccsesstate(productResponse: response));
      }
    } catch (e) {
      print('Exception: $e');
      emit(ProductTabErrorstate(errorMessage: e.toString()));
    }
  }
}
