import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
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
      extendBodyBehindAppBar: true,
      extendBody: true,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                    ),
                  ],
                ),
              ),
              ImageCard(
                imageUrl: AppImages().goldTree,
                width: 185,
                height: 150,
                fit: BoxFit.contain,
              ),
              Container(
                padding: EdgeInsets.only(left: 40, right:40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlutterCustomText(
                      text: 'Login',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors().whiteColor,
                    ),
                    SizedBox(height:15),
                    FlutterInputField(
                      controller: chitIdController,
                      inputType: TextInputType.text,
                      filled: true,
                      fillColor: AppColors().blackColor,
                      enableBorder: false,
                      verticalContentPadding: 8,
                      hintText: 'Enter Chit Id',
                    ),
                    SizedBox(height: 22,),
                    FlutterInputField(
                      controller: passwordController,
                      inputType: TextInputType.text,
                      filled: true,
                      fillColor: AppColors().blackColor,
                      enableBorder: false,
                      obscure: isPasswordObscure,
                      hintText: 'Enter Password',
                      verticalContentPadding: 10,
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
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlutterTextButton(
                          onPresssed: () {},
                          child: GradientText(
                            text: 'ForgetPassword?',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height:25),
              Container(
                padding: EdgeInsets.only(left: 50, right: 50, top: 15),
                child: Column(
                  children: [
                    SizedBox(height: 44,width: 270,
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
                    SizedBox(height:25),
                    FlutterCustomText(
                      text: '(Or) login with',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height:20),
                    SizedBox(height: 44,width: 270,
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
              SizedBox(height:95),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                FlutterCustomText(
                  text: "Guest mode  ",
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                  Icon(Icons.arrow_forward_ios,color: Colors.white,size:18,)
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
