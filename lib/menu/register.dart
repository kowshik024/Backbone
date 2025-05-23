import 'package:backbone/menu/referresult.dart';
import 'package:backbone/utils/gradient_container.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/app_colors.dart';
import '../constant/app_images.dart';
import '../login/bottom_navigation/notification_screen.dart';
import '../utils/action_button.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/flutter_input_field.dart';
import '../utils/gradient_coloured_button.dart';

class Register_Ref extends StatefulWidget {
  @override
  _Register_RefState createState() => _Register_RefState();
}

class _Register_RefState extends State<Register_Ref> {
  String? selectedScheme;
  bool _isDropdownVisible = false;
  final List<String> schemes = [
    '100,000',
    '200,000',
    '500,000',
    '1,000,000',
  ];

  final TextEditingController schemeController = TextEditingController();

  void _toggleDropdown() {
    setState(() {
      _isDropdownVisible = !_isDropdownVisible;
    });
  }
  var chosenvalue;
  List<String> numberlist = [
    "1,00,000", "2,00,000", "5,00,000", "10,00,000",
  ];

  void _dropdownCallback(String? value) {
    setState(() {
      chosenvalue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text("Refer & Earn", style: GoogleFonts.inriaSans(color: Colors.white)),
        actions: [ActionButton(url: AppImages().bellIcon, onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification_Screen()));
        }),],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: GradientText(text: "Boost Your Income!")),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Refer any chit you get 0.5% income!\nEX: 100000 x 0.5% = 500 rupees",
                  style: GoogleFonts.inriaSans(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 25),
              GradientContainer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GradientText(text: "Who You Refer? ", fontSize: 20),
                      SizedBox(height: 6),
                      Text(
                        "Fill in the Details Below",
                        style: GoogleFonts.inriaSans(fontSize: 13, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      FlutterInputField(
                        inputType: TextInputType.text,
                        filled: true,
                        fillColor: AppColors().blackColor,
                        enableBorder: false,
                        verticalContentPadding: 8,
                        hintText: 'Name',
                        hintStyle: GoogleFonts.inriaSans(),
                      ),
                      SizedBox(height: 10),
                      FlutterInputField(
                        inputType: TextInputType.text,
                        filled: true,
                        fillColor: AppColors().blackColor,
                        enableBorder: false,
                        verticalContentPadding: 8,
                        hintText: 'Mobile NO',
                        hintStyle: GoogleFonts.inriaSans(),
                      ),
                      SizedBox(height: 10),
                      FlutterInputField(
                        inputType: TextInputType.text,
                        filled: true,
                        fillColor: AppColors().blackColor,
                        enableBorder: false,
                        verticalContentPadding: 8,
                        hintText: 'Mail ID',
                        hintStyle: GoogleFonts.inriaSans(),
                      ),
                      SizedBox(height: 10),
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
                              "ex: 1,00,000",
                              style: GoogleFonts.inriaSans(color: Colors.white38),
                            ),
                            style: TextStyle(color: Colors.white),
                            dropdownColor: Colors.black,
                            value: chosenvalue,
                            items: numberlist.map((String value) {
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
                      if (_isDropdownVisible)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: AppColors().blackColor,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: schemes.map((scheme) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedScheme = scheme;
                                        schemeController.text = scheme;
                                        _isDropdownVisible = false;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        scheme,
                                        style: GoogleFonts.inriaSans(color: Colors.white),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 100,
                        child: FlutterInputField(
                          inputType: TextInputType.text,
                          filled: true,
                          fillColor: AppColors().blackColor,
                          enableBorder: false,
                          hintText: 'Remarks\nEx,',
                          hintStyle: GoogleFonts.inriaSans(),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.w),
                        child: Material(
                          borderRadius: BorderRadius.circular(50.r),
                          child: GradientColoredButton(
                            width: 300.w,
                            height: 35.h,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => referresult()));
                            },
                            borderRadius: BorderRadius.circular(15.r),
                            child: FlutterCustomText(
                              text: 'Submit',
                              color: AppColors().blackColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
