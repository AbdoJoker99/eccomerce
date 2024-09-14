import 'package:ecomm/Data/api_manger.dart';
import 'package:ecomm/HomeScreen/homeTab/HomeTabViewModel/HomeTabScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Data/model/response/categoryOrBrandResponse.dart';

class Hometabviewmodel extends Cubit<HometabscreenState> {
  Hometabviewmodel() : super(HomeCategoryTabInitialstate());
  List<CategoryOrBrand>? categoriesList;
  List<CategoryOrBrand>? brandsList;
  void getAllCategories() async {
    try {
      emit(HomeCategoryTabLoadinglstate());
      var response = await ApiManager.getAllCategories();
      if (response.statusMsg == "fail") {
        emit(HomeCategoryTabErrorstate(errorMessage: response.message!));
      } else {
        categoriesList = response.data ?? [];
        emit(HomeCategoryTabSuccsesstate(categoryResponse: response));
      }
    } catch (e) {
      emit(HomeCategoryTabErrorstate(errorMessage: e.toString()));
    }
  }

  void getAllBrands() async {
    try {
      emit(HomeCategoryTabLoadinglstate());
      var response = await ApiManager.getAllBrands();
      if (response.statusMsg == "fail") {
        emit(HomeBrandsTabErrorstate(errorMessage: response.message!));
      } else {
        brandsList = response.data ?? [];
        emit(HomeBrandsTabSuccsesstate(categoryResponse: response));
      }
    } catch (e) {
      emit(HomeBrandsTabErrorstate(errorMessage: e.toString()));
    }
  }
}
