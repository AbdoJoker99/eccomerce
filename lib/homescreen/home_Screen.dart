import 'package:flutter/material.dart';

import 'favoriteScreen/FavoriteTab.dart';
import 'homeScreen/hometab.dart';
import 'productlist/ProductListTab.dart';
import 'profile/ProfileTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "ecomm";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectIndex,
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue, // Set background color to blue
        unselectedItemColor: Colors.white, // Set unselected icon color to white
        selectedItemColor: Colors.white, // Set selected icon color to white
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: "listproduct"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "personalData"),
        ],
      ),
      body: IndexedStack(
        index: _selectIndex,
        children: [Hometab(), Productlisttab(), Favoritetab(), Profiletab()],
      ),
    );
  }
}
