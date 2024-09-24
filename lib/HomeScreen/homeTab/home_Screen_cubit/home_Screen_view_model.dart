import 'package:ecomm/homescreen/Productlist/ProductListTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Profile/ProfileTab.dart';
import '../../favoriteScreen/Widgets/FavoriteTab.dart';
import '../hometab.dart';
import 'home_states.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeInitialstate());
  int selectIndex = 0;

  // Define the list of tabs here
  final List<Widget> tabs = [
    Hometab(),
    Productlisttab(),
    Favoritetab(),
    Profiletab(),
  ];
  void channgeSelecedIndex(int newIndex) {
    emit(HomeInitialstate());
    selectIndex = newIndex;
    emit(ChangeSelectedIndexState());
  }
}
