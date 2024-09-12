import 'package:ecomm/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth/login/login.dart';
import 'auth/regestration/sign_Up.dart';
import 'homescreen/cart_screen/cart_screen.dart';
import 'homescreen/home_Screen.dart';
import 'homescreen/productlist/ProductListTab.dart';
import 'homescreen/productlist/widgets/product_details_view.dart';
import 'homescreen/profile/ProfileTab.dart';

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
            ProductDescription.routeName: (context) => ProductDescription(),
            Profiletab.routeName: (context) => Profiletab(),
            Productlisttab.routeName: (context) => Productlisttab(),
            CartScreen.routeName: (context) => CartScreen(),
          },
        );
      },
    );
  }
}
