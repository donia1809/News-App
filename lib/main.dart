import 'package:flutter/material.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/setting/setting-fragment.dart';
import 'package:news_app/splash.dart';
import 'package:news_app/theming/theme.dart';
import 'category/category_fragment.dart';
import 'news/news_details.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: MyThemeData.lightTheme,
     initialRoute:  SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(_) => SplashScreen(),
        HomeScreen.routeName:(_) => HomeScreen(),
        SettingFragment.routeName:(_) => SettingFragment(),
        CategoryFragment.routeName:(_) => CategoryFragment(),
        NewsDetails.routeName:(_) => NewsDetails(),


      },
    );
  }
}
