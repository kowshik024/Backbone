import 'package:backbone/menu/result1.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';

void main() {
  runApp(MaterialApp(home: VerificationScreen()));
}

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final ImagePicker _picker = ImagePicker();
  Map<String, File?> uploadedFiles = {
    "aadharFront": null,
    "aadharBack": null,
    "panCard": null,
    "salarySlip": null,
    "voterID": null,
    "liveImage": null,
  };

  Future<void> _pickImage(String key) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        uploadedFiles[key] = File(image.path);
      });
    }
  }

  Widget _uploadTile(String title, String key) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: Colors.white)),
        GestureDetector(
          onTap: () => _pickImage(key),
          child: Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.all(8),
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Verification',style: TextStyle(color: Colors.white),),
        leading: Icon(Icons.arrow_back_ios,color: Colors.white,),
        actions: [Image(image: AssetImage("assets/whatsapp.png"))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text("KYC Documents", style: TextStyle(color: Colors.white, fontSize: 18)),
            
            SizedBox(height: 10),
           Row(
             children: [
               GradientText(text: "Aadhar Card"),
               SizedBox(width: 20,),
               Icon(Icons.check_circle,color: Colors.green,)
             ],
           ),
            Row(
              children: [
                _uploadTile("Front", "aadharFront"),
                _uploadTile("Back", "aadharBack"),
                _uploadTile("", "aadharBack"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                GradientText(text: "Aadhar Card"),
                SizedBox(width: 20,),
                Icon(Icons.check_circle,color: Colors.green,)
              ],
            ),
            Row(
              children: [
                _uploadTile("PAN", "panCard"),
                _uploadTile("", "panCard"),
              ],
            ),
            SizedBox(height: 20),
            Text("Other Documents", style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(height: 10,),
            GradientText(text: "Salary Slip"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _uploadTile("", "salarySlip"),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GradientText(text: "Vote ID"),
            ),
            Row(
              children: [
                _uploadTile("", "voterID"),
                SizedBox(width: 70,),
                _uploadTile("", "liveImage"),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: 50, right: 50,top: 100),
              child: SizedBox(height: 44,width: 300,
                child: GradientColoredButton(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationSuccessPage()));
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