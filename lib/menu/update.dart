import 'package:backbone/menu/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';
import '../utils/gradient_text.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title:  Text(
          'Update',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
    Navigator.pop(context);
    },
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 80.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/update2.png")),
            SizedBox(height: 10.h),
            GradientText(text: "New Update is Availabe",fontSize: 18.sp,),
            SizedBox(height: 10.h),
            Text(
              'Update your application\nto the latest version',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            GradientText(text: "A brand new version of the chit soft app is\navailable in the play store please update your\napp to use all of amazing features!",fontSize: 14,),
            SizedBox(height: 200.h),
            Padding(
              padding: EdgeInsets.only(left: 50.w, right: 50.w),
              child: SizedBox(height: 44.h,width: 300.w,
                child: GradientColoredButton(
                  onTap: () {},
                  child: FlutterCustomText(
                    text: 'Update',
                    color: AppColors().blackColor,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}