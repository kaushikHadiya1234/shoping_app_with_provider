import 'package:flutter/material.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() => Navigator.pushReplacementNamed(context, '/'),);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            child: Image.asset(
              "assets/images/e1.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
