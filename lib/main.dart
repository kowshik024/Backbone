import 'package:backbone/login/bottom_navigation/bottom_navigation_screen.dart';
import 'package:backbone/login/bottom_navigation/history%202.dart';
import 'package:backbone/login/splash_screen.dart';
import 'package:backbone/login/walkthrough_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Liveauction/LiveScreen.dart';
import 'Liveauction/Liveauction.dart';
import 'Liveauction/SealingAuction.dart';
import 'MyChit/myChit.dart';
import 'login/bottom_navigation/chit_plans.dart';
import 'login/bottom_navigation/ff.dart';
import 'login/bottom_navigation/home_screen.dart';
import 'login/bottom_navigation/new_chit.dart';
import 'login/bottom_navigation/notification_screen.dart';
import 'login/forget_otp.dart';
import 'login/login_screen.dart';
import 'login/otp.dart';
import 'login/otp_screen.dart';
import 'menu/profile.dart';
import 'menu/refer.dart';
import 'menu/register.dart';
import 'menu/verification.dart';



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
        home:SplashScreen(),
      ),
    );
  }
}
