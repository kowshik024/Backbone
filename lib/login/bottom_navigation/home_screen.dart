import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/bottom_navigation/chit_plans.dart';
import 'package:backbone/login/bottom_navigation/my_chits_screen.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
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
                  text: 'Backbone Chit Funds',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
                context.verticalSpacing(10.h),
                ClipRRect(
                  child: ImageCard(
                    imageUrl: AppImages().homeBanner,
                    width: 328.w,
                    height: 185.h,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(width: 140.w,height: 36.h,
                        child: GradientBorderedButton(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Chit_Plans()));
                          },
                          borderRadius: BorderRadius.circular(50.r),
                          isStack: true,
                          child: GradientText(
                              text: "View Chit Plans",
                              fontSize: 12.sp),
                        ),
                      ),
                    ),
                    SizedBox(width:16.w),
                    Expanded(
                      child: SizedBox(width: 160.w,height: 36.h,
                        child: GradientBorderedButton(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>New_Chits()));
                          },
                          borderRadius: BorderRadius.circular(50.r),
                          isStack: true,
                          child: GradientText(
                              text: "New Chit Availability",
                              fontSize: 12.sp),
                        ),
                      ),
                    ),
                  ],
                ),
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
                                      text: 'Chit Value',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    context.verticalSpacing(2.h),
                                    FlutterInputField(
                                      inputType: TextInputType.text,
                                      filled: true,
                                      fillColor: AppColors().blackColor,
                                      enableBorder: false,
                                      verticalContentPadding: 10.h,
                                      hintText: 'eg.,100000',
                                      maxLength: 10,
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: SvgImageCard(
                                          imageUrl: AppImages().dropDownIcon,
                                          fit: BoxFit.cover,
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
                                    text: 'Mobile',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  context.verticalSpacing(2.h),
                                  FlutterInputField(
                                    inputType: TextInputType.text,
                                    filled: true,
                                    fillColor: AppColors().blackColor,
                                    enableBorder: false,
                                    verticalContentPadding: 10.h,
                                    hintText: 'eg.,12',
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GradientText(
                                      text: 'EMI',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    context.verticalSpacing(2.h),
                                    FlutterInputField(
                                      inputType: TextInputType.text,
                                      filled: true,
                                      fillColor: AppColors().blackColor,
                                      enableBorder: false,
                                      verticalContentPadding: 10.h,
                                      hintText: 'eg.,5000',
          
                                      maxLength: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            context.horizontalSpacing(16.w),
                            ImageCard(
                              imageUrl: AppImages().chitFileIcon,
                              width: 80.w,
          
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                      context.verticalSpacing(10.h),
          
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: FlutterCustomText(
                              text:
                              'Note :\nEnter Values In Multiples of Lakhs In Investment',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(50.r),
                            child: GradientColoredButton(
                              width: 130.w,
                              onTap: () {},
                              borderRadius: BorderRadius.circular(50.r),
                              child: FlutterCustomText(
                                text: 'Login',
                                color: AppColors().blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
