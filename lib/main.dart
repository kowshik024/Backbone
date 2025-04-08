import 'package:backbone/login/bottom_navigation/chit_plans.dart';
import 'package:backbone/login/bottom_navigation/home_screen.dart';
import 'package:backbone/login/login_screen.dart';
import 'package:backbone/login/otp_screen.dart';
import 'package:backbone/login/splash_screen.dart';
import 'package:backbone/login/welcome_screen.dart';
import 'package:backbone/menu/profile.dart';
import 'package:backbone/menu/register.dart';
import 'package:backbone/menu/terms%20and%20condition.dart';
import 'package:backbone/utils/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'menu/alreadyagent.dart';
import 'menu/permission.dart';
import 'menu/refer.dart';
import 'menu/result1.dart';
import 'menu/settings.dart';
import 'menu/update.dart';
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
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: refer(),
      ),
    );
  }
}
