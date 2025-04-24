import 'package:backbone/Liveauction/LiveScreen.dart';
import 'package:backbone/Liveauction/Liveauction.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/bottom_navigation/notification_screen.dart';
import 'package:backbone/utils/action_button.dart';
import 'package:backbone/utils/gradient_container.dart';
import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:backbone/utils/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';


class Sealingauction extends StatefulWidget {
  const Sealingauction({super.key});

  @override
  State<Sealingauction> createState() => _SealingauctionState();
}

class _SealingauctionState extends State<Sealingauction> {

  List<Color> gradients = [
    Color(0xFFBF9347),
    Color(0xFFFBF398),
    Color(0xFFF0D571),
    Color(0xFFF9F194),
    Color(0xFFDEAB3D),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: FlutterCustomText(text: "Sealing Auction",fontSize: 20.sp,color: Colors.white,),
        iconTheme: IconThemeData(color: Colors.white),
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        actions: [
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
        ],
      ),
      body:Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height:10.h),
          GradientText(text: "Upcoming Auctions"),
          Text("19/12/2024",style: TextStyle(color: Colors.white),),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(bottom: 20.h),
                    child: GradientContainer(
                      height: 150.h,
                      width: 325.w,
                      child: Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(10.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Live Auction Room Starts at",style: GoogleFonts.inriaSans(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                                GradientText(text: '02:30 PM'),
                                Text("January Month Chit",style: GoogleFonts.inriaSans(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.sp),),
                                GradientText(text: '₹ 10,00,000'),
                              ],),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Livescreen()));
                            },
                            child: Padding(
                              padding:  EdgeInsets.only(top:100.h),
                              child: Container(
                                height: 30.h,
                                width: 94.w,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: AppColors().gradients),
                                  borderRadius: BorderRadius.circular(20.r)
                                ),
                                child: Center(child: FlutterCustomText(text: "Join",fontSize: 14.sp,color: AppColors().blackColor,)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                },
              ),
            ),

        ],),
      ) ,
    );
  }
}
