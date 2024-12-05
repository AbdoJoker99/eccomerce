import 'package:ecomm/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homeTab/home_Screen_cubit/home_Screen_view_model.dart';
import 'homeTab/home_Screen_cubit/home_states.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "ecomm";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      builder: (BuildContext context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: viewModel.selectIndex,
            onTap: (index) {
              setState(() {
                viewModel.selectIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor:
                AppColors.primaryColor, // Set background color to blue
            unselectedItemColor:
                Colors.white, // Set unselected icon color to white
            selectedItemColor: Colors.white, // Set selected icon color to white
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view), label: "listproduct"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "favorite"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "personalData"),
            ],
          ),
          // Use the list and select the tab based on the current index
          body: viewModel.tabs[viewModel.selectIndex],
        );
      },
    );
  }
}
