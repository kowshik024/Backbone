import 'package:backbone/login/bottom_navigation/bottom_navigation_screen.dart';
import 'package:backbone/login/bottom_navigation/history%202.dart';
import 'package:backbone/login/splash_screen.dart';
import 'package:backbone/login/walkthrough_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login/bottom_navigation/ff.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(360,690),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home:Walkthrough_Screen(),
      ),
    );
  }
}
