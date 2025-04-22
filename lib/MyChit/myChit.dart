import 'package:backbone/MyChit/PaymentPage.dart';
import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/utils/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 22.w),
                child: Row(
                  children: [
                    FlutterCustomText(
                      text: "${selectedCount} Chit selected", // Display the selected count
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
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        "Total Chit Overview: ${selectedCount} Chit(s) selected", // Include selected count
                        style: GoogleFonts.inriaSans(color: Colors.white, fontSize: 16.sp),
                        overflow: TextOverflow.ellipsis, // Ensure text doesn't overflow
                      ),
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
              ),
              SizedBox(height: 30.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: chitNames.length,
                itemBuilder: (context, index) {
                  return Padding(
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
                                        ? SizedBox(
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
                                    )
                                        : Text(
                                      chitNames[index],
                                      style: GoogleFonts.inriaSans(fontSize: 16.sp),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isEditingList[index] = true;
                                        });
                                      },
                                      icon: SvgImageCard(
                                        imageUrl: AppImages().edit,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Chit Value", style: TextStyle(color: Colors.white)),
                                  GradientText(text: "₹ 1,00,000"),
                                  Text("Total Inst", style: TextStyle(color: Colors.white)),
                                  GradientText(text: "25"),
                                  Text("Auction Details", style: TextStyle(color: Colors.white)),
                                  GradientText(text: "12/06/2025"),
                                  Text("₹ 1,00,000", style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Paid", style: TextStyle(color: Colors.white)),
                                  GradientText(text: "12/25"),
                                  Text("Status", style: TextStyle(color: Colors.white)),
                                  GradientText(text: "NPS"),
                                  Text("Current Bal", style: TextStyle(color: Colors.white)),
                                  GradientText(text: "₹ 45,000"),
                                  SizedBox(
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
                                ],
                              ),
                            ],
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
