import 'dart:async';
import 'dart:convert';
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
import 'package:http/http.dart' as http;

class NumberOTP extends StatefulWidget {
  NumberOTP({super.key});

  @override
  State<NumberOTP> createState() => _NumberOTPState();
}

class _NumberOTPState extends State<NumberOTP> {
  TextEditingController mobilenumberController = TextEditingController();

  Future getOtp({required String mobile}) async {
    Uri url = Uri.parse('https://chitsoft.in/wapp/api/mobile3/');


    try {
      debugPrint('Started fetching OTP for $mobile');
      final response = await http.post(url, body: {
        'cid': '47157172',
        'mobile': mobile,
        'id': '136',
        'type': '503',
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint(data.toString());

        // Navigate to OTP page with the phone number
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTP_Page(mobileNumber: mobile),
          ),
        );
      } else {
        debugPrint('Data not fetched');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send OTP')),
        );
      }
    } catch (error) {
      debugPrint('Error in fetching: ${error.toString()}');
    }
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
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlutterCustomText(
                      text: 'Enter Your Mobile Number',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors().whiteColor,
                    ),
                    SizedBox(height: 15.h),
                    FlutterInputField(
                      controller: mobilenumberController,
                      inputType: TextInputType.number,
                      filled: true,
                      fillColor: AppColors().blackColor,
                      enableBorder: false,
                      verticalContentPadding: 10,
                      hintText: 'Enter Mobile Number',
                      maxLength: 10,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          String mobile = mobilenumberController.text;
                          if (mobile.length == 10) {
                            await getOtp(mobile: mobile);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Please enter a valid 10-digit number"),
                              ),
                            );
                          }
                        },
                        icon: SvgImageCard(
                          imageUrl: AppImages().sendIcon,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: SizedBox(
                  height: 44,
                  width: 300,
                  child: GradientColoredButton(
                    onTap: () async {
                      String mobile = mobilenumberController.text;
                      if (mobile.length == 10) {
                        await getOtp(mobile: mobile);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                            Text("Please enter a valid 10-digit number"),
                          ),
                        );
                      }
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

// OTP PAGE
class OTP_Page extends StatefulWidget {
  final String mobileNumber;

  OTP_Page({super.key, required this.mobileNumber});

  @override
  State<OTP_Page> createState() => _OTP_PageState();
}

class _OTP_PageState extends State<OTP_Page> {
  TextEditingController otpController = TextEditingController();
  int countdown = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    timer?.cancel();
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
    timer?.cancel();
    super.dispose();
  }

  void verifyOTP() async {
    final url = Uri.parse("https://chitsoft.in/wapp/api/mobile3/"); // Replace with actual endpoint

    try {
      final response = await http.post(
        url,
        body: {
          "cid": "47157172",
          "mobile": "9360958112",
          "otp": otpController.text,  // Use user-entered OTP
          "id": "136",
        },
      );

      final data = json.decode(response.body);
      debugPrint("Response: $data");

      if (response.statusCode == 200 && data['status'] == 'success') {
        // OTP verified, proceed
        Navigator.push(context, MaterialPageRoute(builder: (_) => Login_Screen()));
      } else {
        // Show error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("OTP Verification failed")),
        );
      }
    } catch (e) {
      debugPrint("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Network error")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    String maskedNumber =
    widget.mobileNumber.replaceRange(2, 8, '*' * 6); // mask 6 digits

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
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlutterCustomText(
                    text:
                    'We have sent you a verification code to your \nphone number +91 $maskedNumber',
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
              SizedBox(height: 12.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Pinput.builder(
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
                  Text(
                    "${countdown}s",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(width: 100.w),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        countdown = 30;
                        startCountdown();
                      });
                    },
                    child: GradientText(
                      text: "Resend OTP?",
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: SizedBox(
                  height: 44.h,
                  width: 320.w,
                  child: GradientColoredButton(
                    onTap: () {
                      verifyOTP();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => Login_Screen()));
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
