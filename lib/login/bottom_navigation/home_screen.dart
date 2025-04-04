import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/utils/action_button.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:backbone/utils/flutter_input_field.dart';
import 'package:backbone/utils/gradient_border_color.dart';
import 'package:backbone/utils/gradient_coloured_button.dart';
import 'package:backbone/utils/gradient_container.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.menu,color: Colors.white,),
        actions: [
          GestureDetector(
            onTap: () {},
            child: ImageCard(imageUrl: AppImages().whatsAppIcon),
          ),
          ActionButton(url: AppImages().bellIcon, onTap: () {}),
        ],
      ),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left:16.w),
                  child: GradientText(
                    text: 'Welcome to',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(left:16.w),
                  child: GradientText(
                    text: 'Backbone Chit Funds',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right:16.w,left:16.w,top:20.h,bottom: 20.h),
                  child: ClipRRect(
                    child: ImageCard(
                      imageUrl: AppImages().homeBanner,
                      width: 328.w,
                      height: 185.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(width: 140.w,height: 36.h,
                          child: GradientBorderedButton(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(50.r),
                            isStack: true,
                            child: GradientText(text: 'View Chit Plans',
                              fontSize: 12.sp,),
                          ),
                        ),
                      ),
                      SizedBox(width:16.w),
                      Expanded(
                        child: SizedBox(width: 160.w,height: 36.h,
                          child: GradientBorderedButton(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(50.r),
                            isStack: true,
                            child: GradientText(
                                text: 'New Chit Availability',
                                fontSize: 12.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:18.h),
                Padding(
                  padding:  EdgeInsets.only(left:16.w),
                  child: Container(height: 270.h,width: 328.w,
                    child: GradientContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GradientText(
                            text: 'Chit Scheme Analyzer',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                          ),
                          SizedBox(height: 12.h),
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
                                        Padding(
                                          padding:EdgeInsets.only(left:16.w),
                                          child: GradientText(
                                            text: 'Chit Value',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left:16.w),
                                          child: SizedBox(height: 40.h,width: 140.w,
                                            child: FlutterInputField(
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
                                      Padding(
                                        padding:  EdgeInsets.only(right: 16.w),
                                        child: SizedBox(height: 40.h,width: 127.w,
                                          child: FlutterInputField(
                                            inputType: TextInputType.text,
                                            filled: true,
                                            fillColor: AppColors().blackColor,
                                            enableBorder: false,
                                            verticalContentPadding: 10.h,
                                            hintText: 'eg.,12',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 9.w),
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
                                        Padding(
                                          padding:  EdgeInsets.only(left:16.w),
                                          child: GradientText(
                                            text: 'EMI',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left:16.w),
                                          child: SizedBox(height: 40.h,width: 160.w,
                                            child: FlutterInputField(
                                              inputType: TextInputType.text,
                                              filled: true,
                                              fillColor: AppColors().blackColor,
                                              enableBorder: false,
                                              verticalContentPadding: 10.h,
                                              hintText: 'eg.,5000',
                                              maxLength: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right:41.w,left: 30.w),
                                  child: ImageCard(
                                    imageUrl: AppImages().chitFileIcon,
                                    width: 80.w,
                                    height: 80.h,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom:31.w,left: 16.w),
                                  child: Container(width: 160.w,
                                    child: FlutterCustomText(
                                      text:
                                      'Note :\nEnter Values In Multiples of Lakhs In Investment',
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom:20.w,right: 15.w),
                                child: Material(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: GradientColoredButton(
                                    width: 130.w,
                                    height: 40.h,
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(50.r),
                                    child: FlutterCustomText(
                                      text: 'Login',
                                      color: AppColors().blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}