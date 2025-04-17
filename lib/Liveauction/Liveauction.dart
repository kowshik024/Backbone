import 'package:backbone/Liveauction/LiveScreen.dart';
import 'package:backbone/Liveauction/SealingAuction.dart';
import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Liveauction extends StatefulWidget {
  const Liveauction({super.key});

  @override
  State<Liveauction> createState() => _LiveauctionState();
}

class _LiveauctionState extends State<Liveauction> {


  List<String> Options =[
    'Sealing Auction',
    'Bidding Auction',
  ];

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
      body: Padding(
        padding:  EdgeInsets.only(left: 20.w,right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 20.h),
          GradientText(text: "Auction You Wish To Join",fontSize: 18.sp,),
        SizedBox(height: 30.h),
            SizedBox(
              height: 150.h,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return
                    Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: (){
                        switch(Options[index]){
                          case 'Sealing Auction':
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Sealingauction ()));
                            break;
                          case 'Bidding Auction':
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Livescreen ()));
                            break;
                          default:
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Coming Soon...')));
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: LinearGradient(
                            colors: gradients,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2.r),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.all(8.r),
                                  child: Text(
                                    Options[index],
                                    style: GoogleFonts.inriaSans(fontSize: 16.sp,fontWeight: FontWeight.bold,color: Colors.white)
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.all(8.r),
                                  child: GradientIcon(child: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),


        ],),
      ),
    );
  }
}
