import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/bottom_navigation/notification_screen.dart';
import 'package:backbone/menu/alreadyagent.dart';
import 'package:backbone/menu/register.dart';
import 'package:backbone/menu/settings.dart';
import 'package:backbone/utils/action_button.dart';
import 'package:backbone/utils/gradient_container.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:backbone/utils/image_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/flutter_input_field.dart';
import '../utils/gradient_coloured_button.dart';


class ReferAndEarnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: Text("Refer & Earn", style: TextStyle(color: Colors.white)),
        actions:[
          GestureDetector(
            onTap: () {},
            child: GifView.asset(
              'assets/whatsapp.gif',
              height: 46.h,
              width: 46.h,
              frameRate: 30,
            ),
          ),
          ActionButton(url: AppImages().bellIcon, onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification_Screen()));
          }),
        ]
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GradientText(text: "Boost Your Income!")
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Refer any chit you get 0.5% income!\nEX: 100000 x 0.5% = 500 rupees",
                  style: GoogleFonts.inriaSans(fontSize: 14,color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 25),
              GradientContainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GradientText(text: "Registration Form "),
                      SizedBox(height: 6),
                      Text(
                        "Join our team of professionals and\ngrow your career with Backbone Chitfunds.",
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      FlutterInputField(
                        inputType: TextInputType.text,
                        filled: true,
                        fillColor: AppColors().blackColor,
                        enableBorder: false,
                        verticalContentPadding: 8,
                        hintText: 'Name',
                
                      ),
                      SizedBox(height: 10),
                      FlutterInputField(
                        inputType: TextInputType.text,
                        filled: true,
                        fillColor: AppColors().blackColor,
                        enableBorder: false,
                        verticalContentPadding: 8,
                        hintText: 'Mobile NO',
                
                      ),
                      SizedBox(height: 10),
                      FlutterInputField(
                        inputType: TextInputType.text,
                        filled: true,
                        fillColor: AppColors().blackColor,
                        enableBorder: false,
                        verticalContentPadding: 8,
                        hintText: 'Mail ID',
                
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Already_Agent()));
                          },
                          child: Text(
                            "Already Agent?",
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(bottom:20.w,),
                        child: Material(
                          borderRadius: BorderRadius.circular(50.r),
                          child: GradientColoredButton(
                            width: 300.w,
                            height: 35.h,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Register_Ref()));
                            },
                            borderRadius: BorderRadius.circular(15.r),
                            child: FlutterCustomText(
                              text: 'Register',
                              color: AppColors().blackColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hint, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.black,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellowAccent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellowAccent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}