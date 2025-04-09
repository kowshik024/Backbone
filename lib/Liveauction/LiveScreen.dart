import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/bottom_navigation/notification_screen.dart';
import 'package:backbone/utils/action_button.dart';
import 'package:backbone/utils/flutter_input_field.dart';
import 'package:backbone/utils/gradient_container.dart';
import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:backbone/utils/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';
import 'dart:async';




class Livescreen extends StatefulWidget {
  const Livescreen({super.key});

  @override
  State<Livescreen> createState() => _LivescreenState();
}

class _LivescreenState extends State<Livescreen> {

  bool _isColumnVisible = true;
  bool _dialogShown = false;


  late int _minutes;
  late int _seconds;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _minutes = 1;
    _seconds = 36;


    _startTimer();
  }


  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_seconds == 20) {
        if (_minutes == 1) {
          _showAlertDialog();

        } else {
          _minutes--;
          _seconds = 59;
        }
      } else {
        _seconds--;
      }


      setState(() {});
    });
  }


  void _showAlertDialog() {
    if (!_dialogShown) {
      setState(() {
        _dialogShown = true;
      });

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.watch_later, color: Colors.red, size: 80.sp),
                SizedBox(height: 10),
                Text(
                  "Bidding Close Soon! 0:59 sec",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: double.infinity,
                  height: 50.h,
                  child: GradientColoredButton(
                    borderRadius: BorderRadius.circular(5.r),
                    onTap: () {},
                    child: FlutterCustomText(
                      text: 'Bid Now',
                      color: AppColors().blackColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }



  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
        title: Text("Live Auction",style: GoogleFonts.inriaSans(fontSize: 20.sp,color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {},
            child: ImageCard(imageUrl: AppImages().whatsAppIcon),
          ),
          ActionButton(url: AppImages().bellIcon, onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification_Screen()));
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Text("Live",style: GoogleFonts.inriaSans(fontSize: 12.sp,color: Colors.white),),
                SizedBox(width: 111.w,),
                GradientText(text: '$_minutes:${_seconds.toString().padLeft(2, '0')} Min'),
              ],
            ),
            SizedBox(height: 20.h,),
            GradientContainer(
              width: 328.w,
              child: Padding(
                padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("January Month Chit",style: GoogleFonts.inriaSans(fontSize: 20.sp,color: Colors.white),),
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: GradientText(text: '₹ 10,00,000'),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image(image: AssetImage('assets/manemoji.png')),
                                    Column(children: [
                                      Text("Token No",style: TextStyle(color: Colors.white),),
                                      GradientText(text: "SSC 901")
                                    ],),
                                    Column(children: [
                                      Text("Bid value",style: TextStyle(color: Colors.white),),
                                      GradientText(text: "₹ 10,00,000")
                                    ],)
                                  ],
                                ),
                                Divider(
                                  endIndent: 30,
                                  indent: 30,
                                )
                              ],
                            ),
                          );

                        },
                      ),
                    ),
                    if (_isColumnVisible)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ongoing Bidding Value",style: GoogleFonts.inriaSans(fontSize: 20.sp,color: Colors.white),),
                          SizedBox(height: 10,),
                          SizedBox(height: 40.h,width: 140.w,
                            child:Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: AppColors().gradients),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: FlutterCustomText(
                                  text: '₹ 5,00,000',
                                  fontSize: 16.sp,
                                  color: AppColors().blackColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Enter Your Bid",style: GoogleFonts.inriaSans(fontSize: 20.sp,color: Colors.white),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 140.w,
                                height: 40.h,
                                child: FlutterInputField(
                                  inputType: TextInputType.text,
                                  filled: true,
                                  fillColor: AppColors().blackColor,
                                  enableBorder: false,
                                  verticalContentPadding: 8,
                                  prefixIcon: GradientIcon(child: Icon(Icons.currency_rupee,color: Colors.white,)),
                                  hintText: "5,200,000",
                                  hintStyle: GoogleFonts.inriaSans(fontSize: 14.sp,color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 40.h,width: 100.w,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: AppColors().gradients),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: FlutterCustomText(
                                        text: 'Bid',
                                        fontSize: 16.sp,
                                        color: AppColors().blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 10,),
                          Center(
                            child: SizedBox(height: 44.h,width: 260.w,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _isColumnVisible = false;
                                  });
                                },
                                child: Container(decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(colors: AppColors().gradients)
                                ),
                                  child: Center(
                                    child: FlutterCustomText(
                                      text: 'CALL OFF',
                                      fontSize: 16.sp,
                                      color: AppColors().blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,)
                        ],)],),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}

