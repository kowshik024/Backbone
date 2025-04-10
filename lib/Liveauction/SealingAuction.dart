import 'package:backbone/Liveauction/LiveScreen.dart';
import 'package:backbone/Liveauction/Liveauction.dart';
import 'package:backbone/utils/gradient_container.dart';
import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        backgroundColor: Colors.black,
        title: Text('Sealing Auction',style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        actions: [Image(image: AssetImage("assets/whatsapp.png")),
          Icon(Icons.notification_add,color: Colors.white,)
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
                                Text("Live Auction Room Starts at",style: TextStyle(color: Colors.white),),
                                GradientText(text: '02:30 PM'),
                                Text("January Month Chit",style: TextStyle(color: Colors.white),),
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
