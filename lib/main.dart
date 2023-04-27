import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app_with_provider/Screen/Provider/Product_provider.dart';
import 'package:shoping_app_with_provider/Screen/View/Cart_Screen.dart';
import 'package:shoping_app_with_provider/Screen/View/Dash_Screen.dart';
import 'package:shoping_app_with_provider/Screen/View/Home_Screen.dart';
import 'package:shoping_app_with_provider/Screen/View/Splace.dart';
import 'package:shoping_app_with_provider/Screen/View/View_Screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splace',
        routes: {
          '/':(context) => DashScreen(),
          'home':(context) => HomeScreen(),
          'view':(context) => ViewScreen(),
          'cart':(context) => CartScreen(),
          'splace':(context) => SplaceScreen(),
        },
      ),
    ),
  );
}
