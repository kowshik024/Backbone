import 'package:backbone/menu/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';
import '../utils/gradient_text.dart';



class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title:  FlutterCustomText(text: "Terms & Conditions",color: Colors.white,fontSize:20.sp),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },

        ),
      ),
      body:   Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(right: 150.w),
            child: FlutterCustomText(text: "* Data Safety",fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w700,),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 30.w,right: 30.w),
            child: GradientText(text: "The developer of ChitSoft provides\ninformation on how they collect and share\ndata. Data privacy and security practices\nmay vary based on age,region and use.",fontSize: 15.sp,fontWeight: FontWeight.w400,),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(right: 110.w),
            child: FlutterCustomText(text: "* Terms of Service",fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w700,)
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 30.w,right: 30.w),
            child: GradientText(text: "The terms of service for a service may be\nfound on the service's Application.The\nterms of service may be updated,changed\n or replaced at the discretion of the service\nprovider",fontSize: 15.sp,fontWeight: FontWeight.w400,),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(right: 70.w),
            child: FlutterCustomText(text: "* Acceptance of terms",fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w700,)
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 30.w,right: 30.w),
            child: GradientText(text: "User must read and agree to the term\nand conditions to access the service or\nApplication.Users who do not agree to the\nterms and conditions should not access\nthe Application or register for\nmembership.",fontSize: 15.sp,fontWeight: FontWeight.w400,),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w,right: 30.w),
            child: GradientText(text: "Chit Funds are legal in India and are\n regulated by the chit funds Act of 1262.\nThe act governs the registration and\nmanagement of chit funds",fontSize: 15.sp,fontWeight: FontWeight.w400,),
          ),
        ],
      ),
    );
  }
}