import 'package:backbone/MyChit/PaymentPage.dart';
import 'package:backbone/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';
import '../utils/gradient_text.dart';



class Mychit extends StatefulWidget {
  const Mychit({super.key});

  @override
  State<Mychit> createState() => _MychitState();
}

class _MychitState extends State<Mychit> {

  bool _isDownloading = false;

  List<Color> gradients = [
    Color(0xFFBF9347),
    Color(0xFFFBF398),
    Color(0xFFF0D571),
    Color(0xFFF9F194),
    Color(0xFFDEAB3D),
  ];


  List<String> chitNames =[
    "Chit A",
    "Chit B",
    "Chit C",
    "Chit D",
    "Chit E",
    "Chit F",
    "Chit G",
  ];
  List<bool> _checkboxStates = [false];
  @override
  void initState() {
    super.initState();
    _checkboxStates = List<bool>.filled(chitNames.length, false);
  }

  void _toggleCheckbox(int index) {
    setState(() {
      _checkboxStates[index] = !_checkboxStates[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Text("2 Chit selected",style: TextStyle(color: Colors.white),),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text("Total Chit Overview:",style: TextStyle(color: Colors.white,fontSize: 16.sp),),
              Padding(
                padding:  EdgeInsets.only(right: 50.w),
                child: GradientText(text: '₹ 3540'),
              ),
              SizedBox(height: 34.h,width: 100.w,
                child: GradientColoredButton(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage()));
                  },
                  child: FlutterCustomText(
                    text: 'Pay',
                    color: AppColors().blackColor,
                  ),
                ),
              ),
              ],),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: ExpansionTile(
                  title: GradientText(text: "Current Chit Overview"),
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4.w,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundImage: AssetImage('assets/person.png'),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(8.r),
                          child: Row(
                            children: [
                              Text("Name:", style: TextStyle(color: Colors.white)),
                              GradientText(text: "Nandha Kumar"),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(8.r),
                          child: Row(
                            children: [
                              Text("User ID:", style: TextStyle(color: Colors.white)),
                              GradientText(text: "SSC123"),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(8.r),
                          child: Column(
                            children: [
                              Container(
                                height: 50.h,
                                width: 320.w,
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: gradients,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.r),
                                    topRight: Radius.circular(20.r),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding:   EdgeInsets.all(8.r),
                                  child: Text("Chit Overview"),
                                ),
                              ),
                              Container(
                                width: 320.w, // Responsive width
                                height: 210.w,
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.r),
                                    bottomRight: Radius.circular(20.r),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Total Chit Value", style: TextStyle(color: Colors.white)),
                                        GradientText(text: "₹ 10,00,000"),
                                        Text("Priced Chit Value", style: TextStyle(color: Colors.white)),
                                        GradientText(text: "₹ 12,00,000"),
                                        GradientText(text: "Loans"),
                                        Text("₹ 1,00,000", style: TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("UnPriced Chit Value", style: TextStyle(color: Colors.white)),
                                        GradientText(text: "₹ 12,00,000"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          
            SizedBox(height: 30.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: chitNames.length,
              itemBuilder: (context, index) {
                return
                  Padding(
                    padding:  EdgeInsets.all(8.r),
                    child: Column(children: [
                      Container(
                        height: 50.h,
                        width:320.w,
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => _toggleCheckbox(index),
                                child: Icon(
                                  _checkboxStates[index] ? Icons.check_box : Icons.check_box_outline_blank,                              ),
                              ),
                              Text(chitNames[index]),
                              SizedBox(width: 70.w),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isDownloading = !_isDownloading;
                                  });
                                },
                                child: Icon(
                                  _isDownloading ? Icons.download_done : Icons.download,
                                ),
                              ),
                            ],),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradients,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r)
                            ),
                        ),
                      ),
                      Container(
                        width: 320.w,
                        height: 230.h,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Chit Value",style: TextStyle(color: Colors.white),),
                                GradientText(text: "₹ 1,00,000"),
                                Text("Total Inst",style: TextStyle(color: Colors.white),),
                                GradientText(text: "25"),
                                Text("Auction Details",style: TextStyle(color: Colors.white),),
                                GradientText(text: "12/06/2025"),
                                Text("₹ 1,00,000",style: TextStyle(color: Colors.white),),

                              ],),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Paid",style: TextStyle(color: Colors.white),),
                                GradientText(text: "12/25"),
                                Text("Status",style: TextStyle(color: Colors.white),),
                                GradientText(text: "NPS"),
                                Text("Current Bal",style: TextStyle(color: Colors.white),),
                                GradientText(text: "₹ 45,000"),
                               SizedBox(height: 30.h,width: 94.w,
                                 child: GestureDetector(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage()));
                                   },
                                   child: Container(
                                     decoration: BoxDecoration(
                                       gradient: LinearGradient(colors: AppColors().gradients),
                                       borderRadius: BorderRadius.circular(20.r)
                                     ),
                                     child: Center(child: Text("Pay",style: GoogleFonts.inriaSans(fontSize: 14.sp,color: Colors.black),)),
                                   ),
                                 ),
                               ),
                              ],),
                          ],),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.r),
                                bottomLeft: Radius.circular(20.r)
                            ),
                            border: Border.all(
                                color: Colors.white
                            )
                        ),
                      ),
                    ],),
                  );
                },
            ),
          ],
          ),
        ),
      ),
    );
  }
}
