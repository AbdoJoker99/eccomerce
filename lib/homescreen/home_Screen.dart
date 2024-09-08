import 'package:flutter/material.dart';

import '../auth/login/login.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "todo";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    // var listprovider = Provider.of<ListProvider>(context);
    //var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120, // Reduced toolbar height
        title: Text(
          "homescreen",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          IconButton(
              onPressed: () {
                //listprovider.tasksList = [];
                Navigator.of(context).pushReplacementNamed(Login.routeName);
              },
              icon: Icon(Icons.logout)) // IconButton
        ],
      ),
    );
  }
}
