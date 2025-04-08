import 'package:backbone/menu/update.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/flutter_input_field.dart';
import '../utils/gradient_coloured_button.dart';


void main() {
  runApp(MaterialApp(home: profile()));
}

class profile extends StatefulWidget {
  @override
  _PersonalDetailScreenState createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<profile> {
  File? _image;

  get businessNameController => null;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile',style: TextStyle(color: Colors.white),),
        leading: Icon(Icons.arrow_back_ios,color: Colors.white,),
        actions: [Image(image: AssetImage("assets/whatsapp.png"))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Padding(
            padding: const EdgeInsets.only(left: 40,top: 30),
            child: SizedBox(
              child: GestureDetector(
                onTap: _pickImage,
                child: Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: AppColors().gradients),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),

                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: _image == null
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 40, color: Colors.grey),
                          SizedBox(height: 8),
                          Text("Drag and Drop your image here",style: TextStyle(fontSize: 9,color: Colors.white),),
                          Text("Maximum 5 MB file size",style: TextStyle(fontSize: 10,color: Colors.white),),
                          SizedBox(height: 8,),
                          SizedBox(
                            width: 70,
                            height: 20,
                            child: ElevatedButton(

                              onPressed: _pickImage,
                              child: Text("Upload Image",style: TextStyle(fontSize:6),),
                            ),
                          ),
                        ],
                      )
                          : Image.file(_image!, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: GradientText(text: "Name:",fontSize: 18
              ,)
          ),
          SizedBox(height: 4),
          Padding(
        padding: const EdgeInsets.only(right: 20,left: 20),
        child:  FlutterInputField(
          inputType: TextInputType.text,
          filled: true,
          fillColor: AppColors().blackColor,
          enableBorder: false,
          verticalContentPadding: 8,
          hintText: 'Enter Your name',
        ),
      ),
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(left: 30),
              child: GradientText(text: "User ID:",fontSize: 18
                ,)
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20),
            child:  FlutterInputField(
              inputType: TextInputType.text,
              filled: true,
              fillColor: AppColors().blackColor,
              enableBorder: false,
              verticalContentPadding: 8,
              hintText: 'Enter Your user IDe',
            ),
          ),
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(left: 30),
              child: GradientText(text: "Mobile NO:",fontSize: 18
                ,)
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20),
            child:  FlutterInputField(
              inputType: TextInputType.text,
              filled: true,
              fillColor: AppColors().blackColor,
              enableBorder: false,
              verticalContentPadding: 8,
              hintText: 'Enter Your Mobile No',
            ),
          ),
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(left: 30),
              child: GradientText(text: "Mail ID:",fontSize: 18
                ,)
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20),
            child:  FlutterInputField(
              inputType: TextInputType.text,
              filled: true,
              fillColor: AppColors().blackColor,
              enableBorder: false,
              verticalContentPadding: 8,
              hintText: 'Enter Your Email ID',
              suffixIcon: Icon(Icons.edit_calendar),
            ),
          ),
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(left: 30),
              child: GradientText(text: "Address:",fontSize: 18
                ,)
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 20),
            child:  FlutterInputField(
              inputType: TextInputType.text,
              filled: true,
              fillColor: AppColors().blackColor,
              enableBorder: false,
              verticalContentPadding: 8,
              hintText: 'Enter Your Address',
              suffixIcon: Icon(Icons.edit_calendar),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50,top: 30),
            child: SizedBox(height: 44,width: 300,
              child: GradientColoredButton(
                onTap: () {},
                child: FlutterCustomText(
                  text: 'request',
                  color: AppColors().blackColor,
                ),
              ),
            ),
          ),
     ]
      ),
    );
  }
}
class ProfileField extends StatelessWidget {
  final String label;
  final String value;
  final bool showEdit;

  const ProfileField({
    required this.label,
    required this.value,
    this.showEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$label :",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                SizedBox(height: 3),
                Text(
                  value,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
          if (showEdit)
            Icon(Icons.edit, color: Colors.yellowAccent, size: 18),
        ],
      ),
    );
  }
}