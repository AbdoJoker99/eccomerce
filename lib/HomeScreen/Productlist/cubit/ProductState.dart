import 'package:ecomm/Data/model/failures.dart';
import 'package:ecomm/Data/model/response/AddCartResponse.dart';

import '../../../Data/model/response/ProductResponse.dart';

abstract class Productstate {}

class ProductTabInitialstate extends Productstate {}

class ProductTabLoadinglstate extends Productstate {}

class ProductTabErrorstate extends Productstate {
  String errorMessage;
  ProductTabErrorstate({required this.errorMessage});
}

class ProductTabSuccsesstate extends Productstate {
  ProductResponse productResponse;
  ProductTabSuccsesstate({required this.productResponse});
}

class addCartTabInitialstate extends Productstate {}

class addCartTabLoadinglstate extends Productstate {}

class addCartTabErrorstate extends Productstate {
  Failures failures;
  addCartTabErrorstate({required this.failures});
}

class addCartTabSuccsesState extends Productstate {
  AddCartResponse addtocart;
  addCartTabSuccsesState({required this.addtocart});
}
