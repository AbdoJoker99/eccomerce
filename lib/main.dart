import 'package:ecomm/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth/login/login.dart';
import 'auth/regestration/sign_Up.dart';
import 'homescreen/home_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            Signup.routeName: (context) => Signup(),
            Login.routeName: (context) => Login(),
            SplashScreen.routeName: (context) => SplashScreen(),
          },
        );
      },
    );
  }
}
