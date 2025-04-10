import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/login_screen.dart';
import 'package:backbone/login/space/space.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:backbone/utils/gradient_border_color.dart';
import 'package:backbone/utils/gradient_coloured_button.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:backbone/utils/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({super.key});

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().blackColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(right:20.w,left: 20.w,top:80.h),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      text: 'Welcome to',
                      fontSize: 35.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    GradientText(
                      text: 'Backbone Chit Funds',
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ),
            ImageCard(
              imageUrl: AppImages().goldTree,
              width: 303.w,
              height: 247.h,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height:60.h),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(width: 260.w,height: 44.h,
                    child: GradientColoredButton(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login_Screen()));
                      },
                      child: FlutterCustomText(
                        text: 'Login',
                        color: AppColors().blackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 7.h),
                  FlutterCustomText(
                    text: '(Or)',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 7.h),
                  SizedBox(width: 260.w,height: 44.h,
                    child: GradientBorderedButton(
                      onTap: () {},
                      child: GradientText(text: 'Enquiry'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
