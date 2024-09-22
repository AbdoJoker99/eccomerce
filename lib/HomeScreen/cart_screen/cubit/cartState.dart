import 'package:ecomm/Data/model/response/getProductCartResponse.dart';

import '../../../Data/model/failures.dart';

abstract class cartstate {}

class getCartTabInitialstate extends cartstate {}

class getCartTabLoadinglstate extends cartstate {}

class getCartTabErrorstate extends cartstate {
  Failures failures;
  getCartTabErrorstate({required this.failures});
}

class getCartTabSuccsesState extends cartstate {
  GetProductCartResponse getcart;
  getCartTabSuccsesState({required this.getcart});
}
