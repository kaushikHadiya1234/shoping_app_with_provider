import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app_with_provider/Screen/Provider/Product_provider.dart';
import 'package:shoping_app_with_provider/Screen/View/Cart_Screen.dart';
import 'package:shoping_app_with_provider/Screen/View/Home_Screen.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {

  ProductProvider? pt;
  ProductProvider? pf;
  @override
  Widget build(BuildContext context) {
    pt = Provider.of(context, listen: true);
    pf = Provider.of(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: pt!.i,
          children: [
            HomeScreen(),
            HomeScreen(),
            HomeScreen(),

          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
        backgroundColor: Colors.white,color: Colors.teal,
          onTap: (value) {
            pf!.ChangeValue(value);
          },
          items: [
             Icon(Icons.home,color: Colors.white,),
             Icon(Icons.shopping_cart,color: Colors.white,),
             Icon(Icons.favorite,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
