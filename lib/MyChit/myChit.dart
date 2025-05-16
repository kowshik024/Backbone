import 'dart:convert';

import 'package:backbone/MyChit/PaymentPage.dart';
import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/utils/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../services/api_services.dart';
import '../services/api_services.dart' as globals;
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';
import '../utils/gradient_text.dart';
import 'package:gif_view/gif_view.dart';

class Mychit extends StatefulWidget {
  const Mychit({super.key});

  @override
  State<Mychit> createState() => _MychitState();
}

class _MychitState extends State<Mychit> {
  bool _isDownloading = false; // Initialize _isDownloading

  List<Color> gradients = [
    Color(0xFFBF9347),
    Color(0xFFFBF398),
    Color(0xFFF0D571),
    Color(0xFFF9F194),
    Color(0xFFDEAB3D),
  ];

  List<String> chitNames = [
    "Chit A",
    "Chit B",
    "Chit C",
    "Chit D",
    "Chit E",
    "Chit F",
    "Chit G",
  ];

  List<bool> _checkboxStates = [];
  List<bool> _isEditingList = [];
  List<TextEditingController> _controllers = [];
  List<bool> _isDownloadingList = []; // Track download state for each chit
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    fetchChitDetails();

    _checkboxStates = List<bool>.filled(chitNames.length, false);
    _isEditingList = List<bool>.filled(chitNames.length, false);
    _controllers = List.generate(chitNames.length, (index) => TextEditingController());
    _isDownloadingList = List<bool>.filled(chitNames.length, false); // Initialize with false
  }

  // Toggle the checkbox and update the selected count
  void _toggleCheckbox(int index) {
    setState(() {
      _checkboxStates[index] = !_checkboxStates[index];
    });
  }

  // Get the count of selected checkboxes
  int get selectedCount {
    return _checkboxStates.where((isSelected) => isSelected).length;
  }

  // Get the total amount for the selected chits (assuming ₹1,00,000 per chit for simplicity)
  int get totalAmount {
    int amountPerChit = 100000; // Example amount per chit
    return selectedCount * amountPerChit;
  }

  // Toggle the download state for a specific chit
  void _toggleDownload(int index) {
    setState(() {
      _isDownloadingList[index] = !_isDownloadingList[index]; // Toggle individual download state
    });
  }
  Future<void> fetchChitDetails() async {
    final url = Uri.parse('https://chitsoft.in/wapp/api/mobile3/');

    try {
      final response = await http.post(
        url,
        body: {
          'type': '507',
          'cid': '98387658',
          'cus_id': globalCustomerId ?? null,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('API Response: $data');
        // Do something with the data
      } else {
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Network error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 22.w),
                child: Row(
                  children: [
                    FlutterCustomText(
                      text: "(${selectedCount} Chit selected)", // Display the selected count
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                    SizedBox(width: 14.w),
                    GifView.asset(
                      'assets/mychit.gif',
                      height: 38.h,
                      width: 38.w,
                      frameRate: 30,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Total Chit Amount:", // Include selected count
                    style: GoogleFonts.inriaSans(color: Colors.white, fontSize: 16.sp),
                    overflow: TextOverflow.ellipsis, // Ensure text doesn't overflow
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 17.w),
                    child: GradientText(text: '₹ ${totalAmount}'), // Show the total amount
                  ),
                  SizedBox(
                    height: 34.h,
                    width: 100.w,
                    child: GradientColoredButton(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PaymentPage()),
                        );
                      },
                      child: FlutterCustomText(
                        text: 'Pay',
                        color: AppColors().blackColor,
                      ),
                    ),
                  ),
                ],
              ),


              

             Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              children: [
                Container(
                  height: 50.h,
                  width: 334.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GradientText(
                          text: "Current Chit Overview",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              // Toggle the profile section visibility
                              _isExpanded = !_isExpanded;
                            });
                          },
                          icon: Icon(
                            _isExpanded
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white),
                  ),
                ),
                _isExpanded
                    ? Column(
                  children: [
                    SizedBox(height: 20.h),
                    Center(
                      child: SizedBox(
                        child: GestureDetector(

                          child: Container(
                            height: 150.h,
                            width: 150.h,
                            child:
                            Container(
                              height: 145,
                              width: 145,
                              child:  GlobalUserData().profileImage == null
                                ? Icon(Icons.person,size: 40.sp,)
                                : ClipOval(
                              child: SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: Image.file(
                                  GlobalUserData().profileImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,

                              ),
                            ),
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: AppColors().gradients),
                              shape: BoxShape.circle,

                              border: Border.all(color: Colors.grey),
                            ),

                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 36, bottom: 22),
                      child: Row(
                        children: [
                          Text(
                            'Name : ',
                            style: GoogleFonts.inriaSans(fontSize: 18, color: Colors.white),
                          ),
                          GradientText(
                            text: "Nandha kumar",
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 36),
                      child: Row(
                        children: [
                          Text(
                            'User ID : ',
                            style: GoogleFonts.inriaSans(fontSize: 18, color: Colors.white),
                          ),
                          GradientText(
                            text: "SSC123",
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Column(
                        children: [
                          Container(
                            height: 41.h,
                            width: 320.w,
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child:Text('Chit Overview',style: GoogleFonts.inriaSans(fontSize: 20,fontWeight: FontWeight.w400),) ,

                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradients,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r)),
                            ),
                          ),
                          Container(
                            width: 320.w,
                            height: 257.h,
                            child:
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0,right: 27),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Total Chit Value", style: GoogleFonts.inriaSans(color: Colors.white)),
                                            GradientText(text: "₹ 10,00,000"),

                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("UnPriced Chit Value", style: GoogleFonts.inriaSans(color: Colors.white)),
                                            GradientText(text: "₹ 12,00,000"),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Priced Chit Value", style: GoogleFonts.inriaSans(color: Colors.white)),
                                            GradientText(text: "₹ 12,00,000"),

                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GradientText(text: "LOANS:",fontSize: 18,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Intrest", style: GoogleFonts.inriaSans(color: Colors.white)),
                                            GradientText(text: "₹ 12,00,000"),

                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Outstanding Principale", style: GoogleFonts.inriaSans(color: Colors.white)),
                                            GradientText(text: "₹ 2,00,000"),

                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Total Chit Due", style: GoogleFonts.inriaSans(color: Colors.white)),
                                            GradientText(text: "₹ 12,00,000"),

                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 12.0),
                                          child: SizedBox(
                                            height: 30.h,
                                            width: 94.w,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => PaymentPage()),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: AppColors().gradients),
                                                  borderRadius: BorderRadius.circular(20.r),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Pay",
                                                    style: GoogleFonts.inriaSans(fontSize: 14.sp, color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.r),
                                  bottomLeft: Radius.circular(20.r)),
                              border: Border.all(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
                    : Container(),

              ],
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
                    padding: EdgeInsets.all(8.r),
                    child: Column(
                      children: [
                        Container(
                          height: 41.h,
                          width: 320.w,
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => _toggleCheckbox(index),
                                      child: Icon(
                                        _checkboxStates[index]
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        size: 24.sp,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    _isEditingList[index]
                                        ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                                                                width: 100.w,
                                                                                child: TextFormField(
                                          controller: _controllers[index],
                                          style: GoogleFonts.inriaSans(fontSize: 16.sp, color: Colors.black),
                                          autofocus: true,
                                          onFieldSubmitted: (value) {
                                            setState(() {
                                              chitNames[index] = value;
                                              _isEditingList[index] = false;
                                            });
                                          },
                                                                                ),
                                                                              ),
                                        )
                                        : Text(
                                      chitNames[index],
                                      style: GoogleFonts.inriaSans(fontSize: 16.sp),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isEditingList[index] = true;
                                        });
                                      },
                                      icon: SvgImageCard(
                                        height: 18,
                                        width: 18,
                                        imageUrl: AppImages().edit,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [



                                    SizedBox(width: 20.w),
                                    GestureDetector(
                                      onTap: () {
                                        _toggleDownload(index); // Toggle the download state for this specific chit
                                      },
                                      child: Icon(
                                        _isDownloadingList[index] ? Icons.download_done : Icons.download,
                                        size: 24.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradients,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r)),
                          ),
                        ),
                        Container(
                          width: 320.w,
                          height: 206.h,
                          child:
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0,right: 27),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Chit Value", style: GoogleFonts.inriaSans(color: Colors.white)),
                                          GradientText(text: "₹ 10,00,000"),

                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 30),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Paid", style: GoogleFonts.inriaSans(color: Colors.white)),
                                            GradientText(text: "12/25"),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0,right: 27),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Total Inst", style: GoogleFonts.inriaSans(color: Colors.white)),
                                          GradientText(text: "25"),

                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 30),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Status", style: GoogleFonts.inriaSans(color: Colors.white)),
                                            GradientText(text: "12/25"),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0,right: 27),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Auction Details", style: GoogleFonts.inriaSans(color: Colors.white)),
                                          GradientText(text: "12/06/2025"),

                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Current Bal", style: GoogleFonts.inriaSans(color: Colors.white)),
                                          GradientText(text: "₹ 40,000"),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("₹ 12,00,000", style: GoogleFonts.inriaSans(color: Colors.white)),


                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 12.0),
                                        child: SizedBox(
                                          height: 30.h,
                                          width: 94.w,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => PaymentPage()),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(colors: AppColors().gradients),
                                                borderRadius: BorderRadius.circular(20.r),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Pay",
                                                  style: GoogleFonts.inriaSans(fontSize: 14.sp, color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.r),
                                bottomLeft: Radius.circular(20.r)),
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
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
