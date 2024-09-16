import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Future.delayed(const Duration(seconds: 2), () {
     Navigator.pushReplacementNamed(context, HomeScreen.routeName);
   });
    return Stack(
        children: [
          Container(
            color: Colors.white,
            child: Image.asset(
              'assets/main_background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Center(child: Image.asset('assets/logo.png',)),
        ],
    );
  }
}
