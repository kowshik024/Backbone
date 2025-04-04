import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/utils/action_button.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:backbone/utils/flutter_input_field.dart';
import 'package:backbone/utils/gradient_coloured_button.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:backbone/utils/image_card.dart';
import 'package:backbone/utils/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class Otp_Screen extends StatefulWidget {
  Otp_Screen({super.key});

  @override
  State<Otp_Screen> createState() => _Otp_ScreenState();
}

class _Otp_ScreenState extends State<Otp_Screen> {
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
                      fontSize: 35,
                      fontWeight: FontWeight.w300,
                    ),

                    GradientText(
                      text: 'Backbone Chit Funds',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
              ImageCard(
                imageUrl: AppImages().goldTree,
                width: 184,
                height: 150,
                fit: BoxFit.contain,
              ),
              FlutterCustomText(
                text: 'OTP',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors().whiteColor,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    FlutterCustomText(
                      text:
                      'We have send you a verification code to your \nphone number +91 96******69',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: AppColors().whiteColor,
                    ),
                    FlutterInputField(
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
                    FlutterCustomText(
                      text: 'Enter OTP',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors().whiteColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:30),
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
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors().blackColor,
                                ),
                                child: Text(
                                  pinItemBuilderState.value,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Container(
                            child: Text("${countdown}s",
                                style: TextStyle(color: Colors.white,fontSize: 15)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:180),
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
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: SizedBox(height: 44,width: 300,
                  child: GradientColoredButton(
                    onTap: () {},
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
