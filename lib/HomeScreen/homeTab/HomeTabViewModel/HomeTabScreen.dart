import 'package:ecomm/Data/model/response/categoryOrBrandResponse.dart';

abstract class HometabscreenState {}

class HomeCategoryTabInitialstate extends HometabscreenState {}

class HomeCategoryTabLoadinglstate extends HometabscreenState {}

class HomeCategoryTabErrorstate extends HometabscreenState {
  String errorMessage;
  HomeCategoryTabErrorstate({required this.errorMessage});
}

class HomeCategoryTabSuccsesstate extends HometabscreenState {
  CategoryOrBrandResponse categoryResponse;
  HomeCategoryTabSuccsesstate({required this.categoryResponse});
}

class HomeBrandsTabLoadinglstate extends HometabscreenState {}

class HomeBrandsTabErrorstate extends HometabscreenState {
  String errorMessage;
  HomeBrandsTabErrorstate({required this.errorMessage});
}

class HomeBrandsTabSuccsesstate extends HometabscreenState {
  CategoryOrBrandResponse categoryResponse;
  HomeBrandsTabSuccsesstate({required this.categoryResponse});
}
