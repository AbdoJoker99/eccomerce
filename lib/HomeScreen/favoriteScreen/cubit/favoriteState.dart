import '../../../../../data/model/response/ProductResponse.dart';

abstract class FavouriteTabStates {}

class FavouriteTabInitialState extends FavouriteTabStates {}

class FavouriteTabLoadingState extends FavouriteTabStates {}

class FavouriteTabErrorState extends FavouriteTabStates {
  final String errorMsg;
  FavouriteTabErrorState({required this.errorMsg});
}

class FavouriteTabSuccessState extends FavouriteTabStates {
  final List<Product> favouriteProducts;
  FavouriteTabSuccessState({required this.favouriteProducts});
}
