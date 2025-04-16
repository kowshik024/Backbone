import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/forget_otp.dart';
import 'package:backbone/login/otp_screen.dart';
import 'package:backbone/utils/action_button.dart';
import 'package:backbone/login/bottom_navigation/bottom_navigation_screen.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:backbone/utils/flutter_input_field.dart';
import 'package:backbone/utils/gradient_coloured_button.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:backbone/utils/image_card.dart';
import 'package:backbone/utils/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class Forget_password extends StatefulWidget {
  Forget_password({super.key});

  @override
  State<Forget_password> createState() => _Forget_passwordState();
}

class _Forget_passwordState extends State<Forget_password> {
  TextEditingController mobilenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ActionButton(
          url: AppImages().backIcon,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors().whiteColor,
      ),
      backgroundColor: AppColors().blackColor,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
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
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
              ImageCard(
                imageUrl: AppImages().goldTree,
                width: 184.w,
                height: 150.h,
                fit: BoxFit.contain,
              ),
              FlutterCustomText(
                text: 'OTP',
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: AppColors().whiteColor,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    FlutterCustomText(
                      text:
                      'Enter Your Mobile Number',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors().whiteColor,
                    ),
                    SizedBox(height: 15.h),
                    FlutterInputField(
                      controller: mobilenumberController,
                      inputType: TextInputType.text,
                      filled: true,
                      fillColor: AppColors().blackColor,
                      enableBorder: false,
                      verticalContentPadding: 10,
                      hintText: 'Enter Mobile Number',
                      maxLength: 10,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgImageCard(
                          imageUrl: AppImages().sendIcon,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:50.h),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: SizedBox(height: 44,width: 300,
                  child: GradientColoredButton(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgot_otp()));
                    },
                    child: FlutterCustomText(
                      text: 'Send OTP',
                      color: AppColors().blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
