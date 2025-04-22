import 'package:backbone/menu/result1.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final ImagePicker _picker = ImagePicker();

  Map<String, File?> uploadedFiles = {
    "aadharFront": null,
    "aadharBack": null,
    "panFront": null,
    "panBack": null,
    "salarySlip": null,
    "voterID": null,
    "liveImage": null,
  };

  Future<void> _pickImage(String key, {bool fromCamera = false}) async {
    final XFile? image = await _picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        uploadedFiles[key] = File(image.path);
      });
    }
  }

  Widget _uploadTile(String key, {bool useCamera = false}) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: () => _pickImage(key, fromCamera: useCamera),
          child: Container(
            width: 70.w,
            height: 70.h,
            margin: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),
            ),
            child: uploadedFiles[key] != null
                ? ClipOval(
              child: Image.file(uploadedFiles[key]!, fit: BoxFit.cover),
            )
                : Icon(Icons.add, color: Colors.white),
          ),
        ),
        if (uploadedFiles[key] != null)
          Positioned(
            top: 4.r,
            right: 4.r,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(4.r),
              child: Icon(Icons.check, size: 14.sp, color: Colors.white),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Verification', style: GoogleFonts.inriaSans(color: Colors.white)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          GifView.asset(
            'assets/whatsapp.gif',
            height: 46.h,
            width: 46.h,
            frameRate: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("KYC Documents", style: GoogleFonts.inriaSans(color: Colors.white, fontSize: 18)),
            SizedBox(height: 10.h),
            Row(
              children: [
                GradientText(text: "Aadhar Card"),
                SizedBox(width: 20.w),
                if (uploadedFiles["aadharFront"] != null && uploadedFiles["aadharBack"] != null)
                  Icon(Icons.check_circle, color: Colors.green),
              ],
            ),
            Row(
              children: [
                _uploadTile("aadharFront"),
                _uploadTile("aadharBack"),
              ],
            ),
            Row(
              children: [
                GradientText(text: "Pan Card"),
                SizedBox(width: 20.sp),
                if (uploadedFiles["panFront"] != null && uploadedFiles["panBack"] != null)
                  Icon(Icons.check_circle, color: Colors.green),
              ],
            ),
            Row(
              children: [
                _uploadTile("panFront"),
                _uploadTile("panBack"),
              ],
            ),
            Text("Other Documents", style: GoogleFonts.inriaSans(color: Colors.white, fontSize: 18)),
            SizedBox(height: 10.sp),
            GradientText(text: "Salary Slip"),
            Row(
              children: [
                _uploadTile("salarySlip"),
              ],
            ),
            Row(

              children: [
                GradientText(text: "Vote ID"),
                SizedBox(width: 96.w),
                GradientText(text: "Live Image"),
              ],
            ),
            Row(

              children: [
                _uploadTile("voterID"),
                SizedBox(width: 70.w),
                _uploadTile("liveImage", useCamera: true),
              ],
            ),
            SizedBox(height: 12.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w),
              child: SizedBox(
                height: 44.h,
                width: 300.w,
                child: GradientColoredButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationSuccessPage()));
                  },
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
    );
  }
}
