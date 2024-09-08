import 'dart:async';

import 'package:flutter/material.dart';

import 'auth/login/login.dart';


class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash screen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(Login.routeName);
    }); // Timer
    return Scaffold(
      body: Image.asset(
        'assets/images/Splash Screen.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    ); // Image.asset, Scaffold
  }
}
