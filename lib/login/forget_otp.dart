import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/reset_pasword.dart';
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

class Forgot_otp extends StatefulWidget {
  Forgot_otp({super.key});

  @override
  State<Forgot_otp> createState() => _Forgot_otpState();
}

class _Forgot_otpState extends State<Forgot_otp> {
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox(width: 10.w,),
                        Container(
                          child: Text("${countdown}s",
                              style: TextStyle(color: Colors.white,fontSize: 15)),
                        ),
                        SizedBox(width: 170.w,),
                        Container(
                          child: TextButton(onPressed: (){
                            setState(() {
                              countdown = 30;
                              startCountdown();
                            });
                          }, child: GradientText(text: "Resend OTP?",decoration: TextDecoration.underline,)),
                        )
                      ],
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasword()));
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
