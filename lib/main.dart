import 'package:ecomm/HomeScreen/Productlist/cubit/ProductViewmodel.dart';
import 'package:ecomm/homescreen/Productlist/ProductListTab.dart';
import 'package:ecomm/share_prefrance_utils.dart';
import 'package:ecomm/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'HomeScreen/favoriteScreen/Widgets/FavoriteTab.dart';
import 'auth/login/login.dart';
import 'auth/regestration/sign_Up.dart';
import 'homescreen/cart_screen/cart_screen.dart';
import 'homescreen/home_Screen.dart';
import 'homescreen/productlist/widgets/product_details_view.dart';
import 'homescreen/profile/ProfileTab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize shared preferences
  await SharedPreferenceUtils.init();

  runApp(
    MultiBlocProvider(
      providers: [
        // Register the blocs/cubits that the app will use
        BlocProvider(create: (context) => ProductViewModel()),
        // You can add more BlocProviders as needed
      ],
      child: MyApp(),
    ),
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
          initialRoute: Login.routeName,
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            Signup.routeName: (context) => Signup(),
            Login.routeName: (context) => Login(),
            SplashScreen.routeName: (context) => SplashScreen(),
            ProductDescription.routeName: (context) => ProductDescription(),
            Profiletab.routeName: (context) => Profiletab(),
            Productlisttab.routeName: (context) => Productlisttab(),
            CartScreen.routeName: (context) => CartScreen(),
            Favoritetab.routeName: (context) => Favoritetab(),
          },
        );
      },
    );
  }
}
