import 'dart:async';
import 'dart:convert';

import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/forgot_password.dart';
import 'package:backbone/login/otp_screen.dart';
import 'package:backbone/login/welcome_screen.dart';
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
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';


import '../services/api_services.dart' as globals;
import '../utils/svg_image.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {

  final TextEditingController chitIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState>  form = GlobalKey<FormState>();

  bool isPasswordObscure = true;

  Future Login({required String chitId,required String password,})async{

    Uri url = Uri.parse('https://chitsoft.in/wapp/api/mobile3/');

    try {
      debugPrint('Started fetching...');
      final response = await http.post(
        url,
        body: {
          'type': '501',
          'cid': '98387658',
          'user_id': chitId,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint('Response data: $data');
        globals.globalCustomerId = data['cus_id'].toString();
        print(globals.globalCustomerId);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Bottom_Navigation()),
        );
      } else {
        debugPrint('Server responded with status: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server error: ${response.statusCode}')),
        );
      }
    } catch (error) {
      debugPrint('Error in fetching: ${error.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Network error: ${error.toString()}')),
      );
    }


  }

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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Welcome_Screen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form,
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
                        hintText: 'Enter Chit ID',
                        verticalContentPadding: 10,

                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(height: 44.h,width: 280.w,
                      child: FlutterInputField(
                        verticalContentPadding: 10,
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
                         if (chitIdController.text.isEmpty && passwordController.text.isEmpty
                         ){
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enter ID & password')));
                         }
                         else if (passwordController.text.isEmpty
                          ){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Password')));
                          }
                          else if (chitIdController.text.isEmpty
                          ){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enter ID')));
                          }else{
                           Login(chitId:chitIdController.text ,password: passwordController.text
                           );
                         }
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NumberOTP()));
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
      ),
    );
  }
}
