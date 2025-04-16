import 'package:backbone/Liveauction/LiveScreen.dart';
import 'package:backbone/Liveauction/Liveauction.dart';
import 'package:backbone/Liveauction/SealingAuction.dart';
import 'package:backbone/MyChit/PaymentPage.dart';
import 'package:backbone/MyChit/myChit.dart';
import 'package:backbone/login/bottom_navigation/chit_plans.dart';
import 'package:backbone/login/bottom_navigation/history%202.dart';
import 'package:backbone/login/bottom_navigation/home_screen.dart';
import 'package:backbone/login/bottom_navigation/new_chit.dart';
import 'package:backbone/login/bottom_navigation/notification_screen.dart';
import 'package:backbone/login/forgot_password.dart';
import 'package:backbone/login/login_screen.dart';
import 'package:backbone/login/otp.dart';
import 'package:backbone/login/otp_screen.dart';
import 'package:backbone/login/reset_pasword.dart';
import 'package:backbone/login/splash_screen.dart';
import 'package:backbone/login/welcome_screen.dart';
import 'package:backbone/menu/permission.dart';
import 'package:backbone/menu/profile.dart';
import 'package:backbone/menu/refer.dart';
import 'package:backbone/menu/register.dart';
import 'package:backbone/menu/settings.dart';
import 'package:backbone/menu/terms%20and%20condition.dart';
import 'package:backbone/menu/update.dart';
import 'package:backbone/menu/verification.dart';
import 'package:backbone/login/bottom_navigation/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'menu/alreadyagent.dart';


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
        home:Bottom_Navigation(),
      ),
    );
  }
}
