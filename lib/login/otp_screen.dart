import 'dart:async';

import 'package:backbone/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../constant/app_colors.dart';
import '../constant/app_images.dart';
import '../utils/action_button.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/flutter_input_field.dart';
import '../utils/gradient_coloured_button.dart';
import '../utils/gradient_text.dart';
import '../utils/image_card.dart';
import '../utils/svg_image.dart';
class NumberOTP extends StatefulWidget {
  NumberOTP({super.key});

  @override
  State<NumberOTP> createState() => _NumberOTPState();
}

class _NumberOTPState extends State<NumberOTP> {
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OTP_Page()));
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

class OTP_Page extends StatefulWidget {
  OTP_Page({super.key});

  @override
  State<OTP_Page> createState() => _OTP_PageState();
}

class _OTP_PageState extends State<OTP_Page> {
  TextEditingController otpController = TextEditingController();

  int countdown = 30;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void verifyOTP() {
    print("Entered OTP: ${otpController.text}");
  }

  @override
  Widget build(BuildContext context) {
    // OtpController controller = Get.find<OtpController>();
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
                padding: EdgeInsets.only(left: 20, right: 20),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlutterCustomText(
                      text:
                      'We have send you a verification code to your \nphone number +91 96******69',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors().whiteColor,
                    ),
                    FlutterCustomText(
                      text: 'Enter OTP',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors().whiteColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.sp),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:30.w),
                      child: Pinput.builder(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        length: 6,
                        controller: otpController,
                        builder: (context, pinItemBuilderState) {
                          return ShaderMask(
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                colors: AppColors().gradients,
                              ).createShader(bounds);
                            },
                            child: Container(
                              padding: EdgeInsets.all(1.r),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  color: AppColors().blackColor,
                                ),
                                child: Text(
                                  pinItemBuilderState.value,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                        padding:  EdgeInsets.only(left: 40.w),
                        child: Row(
                          children: [
                            Container(
                              child: Text("${countdown}s",
                                  style: TextStyle(color: Colors.white,fontSize: 15)),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left:180.w),
                              child: Container(
                                child: TextButton(onPressed: (){
                                  setState(() {
                                    countdown = 30;
                                    startCountdown();
                                  });
                                }, child: GradientText(text: "Resend OTP?",decoration: TextDecoration.underline,)),
                              ),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(left: 50.w, right: 50.w),
                child: SizedBox(height: 44.h,width: 320.w,
                  child: GradientColoredButton(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen()));
                    },
                    child: FlutterCustomText(
                      text: 'VERIFY',
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