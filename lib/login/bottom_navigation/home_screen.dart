import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/bottom_navigation/chit_plans.dart';
import 'package:backbone/login/bottom_navigation/new_chit.dart';
import 'package:backbone/login/bottom_navigation/notification_screen.dart';
import 'package:backbone/login/login_screen.dart';
import 'package:backbone/login/space/space.dart';
import 'package:backbone/utils/action_button.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:backbone/utils/flutter_input_field.dart';
import 'package:backbone/utils/gradient_border_color.dart';
import 'package:backbone/utils/gradient_coloured_button.dart';
import 'package:backbone/utils/gradient_container.dart';
import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:backbone/utils/image_card.dart';
import 'package:backbone/utils/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/api_services.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var chosenvalue;
  List<String> numberList = Chitlist().chitlist;

  void _dropdownCallback(String? value) {
    setState(() {
      chosenvalue = value;
    });
  }
  bool showChitList = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().blackColor,
      body: SafeArea(
        child: Container(
          padding: context.horizontalPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  text: 'Welcome to',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
                GradientText(
                  text: 'Backbone Chit Funds!',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                context.verticalSpacing(10.h),
                SizedBox(height: 25.h),
                ClipRRect(
                  child: ImageCard(
                    imageUrl: AppImages().homeBanner,
                    width: 328.w,
                    height: 185.h,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 140.w,
                        height: 36.h,
                        child: GradientBorderedButton(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => My_Chit_Plans()));
                          },
                          borderRadius: BorderRadius.circular(50.r),
                          isStack: true,
                          child: GradientText(text: "View Chit Plans", fontSize: 12.sp,),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: SizedBox(
                        width: 160.w,
                        height: 36.h,
                        child: GradientBorderedButton(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => New_Chits()));
                          },
                          borderRadius: BorderRadius.circular(50.r),
                          isStack: true,
                          child: GradientText(text: "New Chit Availability", fontSize: 12.sp,),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                context.verticalSpacing(10.h),
                GradientContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GradientText(
                        text: 'Chit Scheme Analyzer',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                      ),
                      context.verticalSpacing(10.h),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GradientText(
                                      text: 'Chit Value ₹',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    context.verticalSpacing(2.h),
                                    Container(
                                      padding: EdgeInsets.all(1.r),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.r),
                                        gradient: LinearGradient(colors: AppColors().gradients),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(8.r),
                                        ),
                                        padding: EdgeInsets.all(2.r),
                                        child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            filled: true,
                                            fillColor: AppColors().blackColor,
                                          ),
                                          hint: Text(
                                            "Ex: 1,00,000",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                          style: TextStyle(color: Colors.white),
                                          dropdownColor: Colors.black,
                                          value: chosenvalue,
                                          items: numberList.map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String? newvalue) {
                                            setState(() {
                                              chosenvalue = newvalue;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            context.horizontalSpacing(16.w),
                            SizedBox(
                              width: 127.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GradientText(
                                    text: 'Month',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  context.verticalSpacing(2.h),
                                  FlutterInputField(
                                    inputType: TextInputType.number,
                                    filled: true,
                                    fillColor: AppColors().blackColor,
                                    enableBorder: false,
                                    verticalContentPadding: 10.h,
                                    hintText: 'Ex:12',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      context.verticalSpacing(6.h),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 160.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GradientText(
                                      text: 'EMI ₹',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    context.verticalSpacing(2.h),
                                    Container(
                                      width: 160.w,
                                      child: FlutterInputField(
                                        inputType: TextInputType.number,
                                        filled: true,
                                        fillColor: AppColors().blackColor,
                                        enableBorder: false,
                                        verticalContentPadding: 10.h,
                                        hintText: 'Ex: 5000',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        maxLength: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            context.horizontalSpacing(16.w),
                            Padding(
                              padding: const EdgeInsets.only(right: 41),
                              child: GifView.asset(
                                'assets/homescreen.gif',
                                height: 80.h,
                                width: 80.w,
                                frameRate: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      context.verticalSpacing(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: FlutterCustomText(
                              text: 'Note :\nEnter Values In Multiples of Lakhs In Investment',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Material(
                            borderRadius: BorderRadius.circular(50.r),
                            child: GradientColoredButton(
                              height: 40.h,
                              width: 130.w,
                              onTap: () {
                                if (chosenvalue != null && numberList.contains(chosenvalue!)) {
                                  setState(() {
                                    showChitList = true;
                                  });
                                } else {
                                  setState(() {
                                    showChitList = false;
                                  });
                                }
                              },
                              borderRadius: BorderRadius.circular(50.r),
                              child: FlutterCustomText(
                                text: 'Enter',
                                color: AppColors().blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
                if (showChitList)
                  Container(
                    margin: EdgeInsets.only(top: 15.h),
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    height: 150.h,
                    child: ListView.builder(
                      itemCount: 1, // update this if you have actual data
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "Selected Chit: ₹$chosenvalue",
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            "Details or EMI info goes here",
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                context.verticalSpacing(15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
