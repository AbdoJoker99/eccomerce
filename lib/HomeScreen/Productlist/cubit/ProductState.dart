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
