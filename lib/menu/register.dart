import 'package:backbone/menu/referresult.dart';
import 'package:backbone/menu/settings.dart';
import 'package:backbone/utils/gradient_container.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/flutter_input_field.dart';
import '../utils/gradient_coloured_button.dart';



class Register_Ref extends StatelessWidget {
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
        actions: [Icon(Icons.notifications_none, color: Colors.white)],
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
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 25),
              GradientContainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GradientText(text: "who You Refer? ",fontSize: 20,),
                      SizedBox(height: 6),
                      Text(
                        "fill in the Details Below",
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
                      FlutterInputField(
                        inputType: TextInputType.text,
                        filled: true,
                        fillColor: AppColors().blackColor,
                        enableBorder: false,
                        verticalContentPadding: 8,
                        hintText: 'Select Scheme',
                      suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.white,),),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 100,
                        child: FlutterInputField(
                          inputType: TextInputType.text,
                          filled: true,
                          fillColor: AppColors().blackColor,
                          enableBorder: false,

                          hintText: 'Remarks\nEx,',

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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>referresult()));
                            },
                            borderRadius: BorderRadius.circular(15.r),
                            child: FlutterCustomText(
                              text: 'Submit',
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