import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/forgot_password.dart';
import 'package:backbone/login/otp_screen.dart';
import 'package:backbone/utils/action_button.dart';
import 'package:backbone/login/bottom_navigation/bottom_navigation_screen.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:backbone/utils/flutter_input_field.dart' show FlutterInputField;
import 'package:backbone/utils/flutter_text_button.dart';
import 'package:backbone/utils/gradient_border_color.dart';
import 'package:backbone/utils/gradient_coloured_button.dart';
import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:backbone/utils/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {

  final TextEditingController chitIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().blackColor,
      extendBodyBehindAppBar: false,
      extendBody: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors().whiteColor,
        leading: ActionButton(
          url: AppImages().backIcon,
          onTap: () {
            Navigator.pop(context);
            },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right:20.w,left: 20.w),
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
            SizedBox(height:2.h),
            ImageCard(
              imageUrl: AppImages().goldTree,
              width: 185.w,
              height: 150.h,
              fit: BoxFit.contain,
            ),
            Container(
              padding: EdgeInsets.only(left: 40.w, right:40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterCustomText(
                    text: 'Login',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors().whiteColor,
                  ),
                  SizedBox(height:13.h),
                  SizedBox(height: 44.h,width: 280.w,
                    child: FlutterInputField(
                      controller: chitIdController,
                      inputType: TextInputType.text,
                      filled: true,
                      fillColor: AppColors().blackColor,
                      enableBorder: false,
                      hintText: 'Enter Chit Id',
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(height: 44.h,width: 280.w,
                    child: FlutterInputField(
                      controller: passwordController,
                      inputType: TextInputType.text,
                      filled: true,
                      fillColor: AppColors().blackColor,
                      enableBorder: false,
                      obscure: isPasswordObscure,
                      hintText: 'Enter Password',
                      suffixIcon: IconButton(
                        icon: GradientIcon(
                        child:  isPasswordObscure
                              ? Icon(Icons.visibility_off_outlined,color: AppColors().whiteColor )
                              : Icon(Icons.visibility_outlined,color: AppColors().whiteColor,),
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordObscure = !isPasswordObscure;
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlutterTextButton(
                        onPresssed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Forget_password()));
                        },
                        child: GradientText(
                          text: 'ForgotPassword?',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 44.h,width: 260.w,
                    child: GradientColoredButton(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Bottom_Navigation()));
                      },
                      child: FlutterCustomText(
                        text: 'Login',
                        color: AppColors().blackColor,
                      ),
                    ),
                  ),
                  SizedBox(height:15.h),
                  FlutterCustomText(
                    text: '(Or) login with',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height:15.h),
                  SizedBox(height: 44.h,width: 260.w,
                    child: GradientBorderedButton(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Otp_Screen()));
                      },
                      child: GradientText(text: 'Mobile Number'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              FlutterCustomText(
                text: "Guest mode  ",
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
                Icon(Icons.arrow_forward_ios,color: Colors.white,size:18,)
            ],),
          ],
        ),
      ),
    );
  }
}
