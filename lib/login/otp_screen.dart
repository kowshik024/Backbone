import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
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
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class Otp_Screen extends StatefulWidget {
  Otp_Screen({super.key});

  @override
  State<Otp_Screen> createState() => _Otp_ScreenState();
}

class _Otp_ScreenState extends State<Otp_Screen> {
  TextEditingController mobileController = TextEditingController();
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Center(
                child: ImageCard(
                  imageUrl: AppImages().goldTree,
                  width: 184.w,
                  height: 150.h,
                  fit: BoxFit.contain,
                ),
              ),
              Center(
                child: FlutterCustomText(
                  text: 'OTP',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors().whiteColor,
                ),
              ),
              SizedBox(height: 19,),
              Padding(
                padding: EdgeInsets.only(left: 40.w),
                child: FlutterCustomText(
                  text: 'We have send you a verification code to your\nphone number +91 96******69',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors().whiteColor,
                ),
              ),
              SizedBox(height: 13.sp),
              // Mobile Number Field
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: SizedBox(
                  height: 44.h,
                  width: 320.w,
                  child: FlutterInputField(
                    verticalContentPadding: 10.h,
                    controller: mobileController,
                    inputType: TextInputType.phone,
                    filled: true,
                    fillColor: AppColors().blackColor,
                    enableBorder: false,
                    hintText: 'Enter Mobile Number',
                    
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: ShaderMask(
                        shaderCallback: (bounds) {
                          return LinearGradient(
                            colors: AppColors().gradients,
                          ).createShader(bounds);
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        // Send OTP action here
                        print('Sending OTP to ${mobileController.text}');
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13.sp),
              // OTP Input Field
              Padding(
                padding: EdgeInsets.only(left: 40.w),
                child: FlutterCustomText(
                  text: 'Enter OTP',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors().whiteColor,
                ),
              ),
              SizedBox(height: 12,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
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
              SizedBox(height: 5.h),
              // Countdown and Resend OTP
              Padding(
                padding: EdgeInsets.only(left: 40.w),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "${countdown}s",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 180.w),
                      child: Container(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              countdown = 30;
                              timer.cancel(); // Cancel previous timer
                              startCountdown();
                            });
                          },
                          child: GradientText(
                            text: "Resend OTP?",
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              // Verify Button
              Padding(
                padding: EdgeInsets.only(left: 50.w, right: 50.w),
                child: SizedBox(
                  height: 44.h,
                  width: 320.w,
                  child: GradientColoredButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Bottom_Navigation()));
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
