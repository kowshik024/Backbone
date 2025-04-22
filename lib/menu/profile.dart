import 'package:backbone/menu/update.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../constant/app_colors.dart';
import '../login/bottom_navigation/bottom_navigation_screen.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/flutter_input_field.dart';
import '../utils/gradient_coloured_button.dart';



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
        title: Text('Profile',style: GoogleFonts.inriaSans(color: Colors.white),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        actions: [GifView.asset(
          'assets/whatsapp.gif',
          height: 46.h,
          width: 46.h,
          frameRate: 30,
        ),],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              child: GestureDetector(
                onTap: _pickImage,  // Add functionality for image picker
                child: Container(
                  height: 150.h,
                  width: 150.h,  // Ensure the container is square and maintains the circle shape
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: AppColors().gradients),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: _image == null
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,  // Ensure alignment is centered
                      children: [
                        Icon(Icons.image, size: 40.sp, color: Colors.grey),
                        SizedBox(height: 8.h),
                        Text(
                          "Drag and Drop your image here",
                          style: TextStyle(fontSize: 9, color: Colors.white),
                          textAlign: TextAlign.center,  // Ensure the text is centered
                        ),
                        Text(
                          "Maximum 5 MB file size",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                          textAlign: TextAlign.center,  // Ensure the text is centered
                        ),
                        SizedBox(height: 8.h),
                      ],
                    )
                        : ClipOval(  // Clip the image to a circular shape when it's picked
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,  // Ensures the image fits within the circle
                        width: 130.w,  // The width should match the container size (slightly smaller for padding)
                        height: 130.h,  // The height should match the container size (slightly smaller for padding)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 5.h),
          Padding(
            padding:  EdgeInsets.only(left: 30.w),
            child: GradientText(text: "Name:",fontSize: 14.sp
              ,)
          ),
          SizedBox(height:4.h),
          Padding(
        padding:  EdgeInsets.only(right: 20.w,left: 20.w),
        child:  SizedBox(height: 40.h,width: 320.w,
          child: FlutterInputField(
            inputType: TextInputType.text,
            filled: true,
            fillColor: AppColors().blackColor,
            enableBorder: false,
            verticalContentPadding:8.h,
            hintText: 'Enter Your name',
          ),
        ),
      ),
          SizedBox(height: 10.h),
          Padding(
              padding:  EdgeInsets.only(left: 30.w),
              child: GradientText(text: "User ID:",fontSize: 14.sp
                ,)
          ),
          SizedBox(height: 4.h),
          Padding(
            padding:  EdgeInsets.only(right: 20.w,left: 20.w),
            child:  SizedBox(height: 40.h,width: 320.w,
              child: FlutterInputField(
                inputType: TextInputType.text,
                filled: true,
                fillColor: AppColors().blackColor,
                enableBorder: false,
                verticalContentPadding: 8.h,
                hintText: 'Enter Your user ID',
                hintStyle: GoogleFonts.inriaSans(),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
              padding:  EdgeInsets.only(left: 30.w),
              child: GradientText(text: "Mobile NO:",fontSize: 14.sp
                ,)
          ),
          SizedBox(height: 4.h),
          Padding(
            padding:  EdgeInsets.only(right: 20.w,left: 20.w),
            child:  SizedBox(height: 40.h,width: 320.w,
              child: FlutterInputField(
                inputType: TextInputType.text,
                filled: true,
                fillColor: AppColors().blackColor,
                enableBorder: false,
                verticalContentPadding: 8.h,
                hintText: 'Enter Your Mobile No',
                hintStyle: GoogleFonts.inriaSans(),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(

              padding:  EdgeInsets.only(left: 30.w),
              child: GradientText(text: "Mail ID:",fontSize: 14.sp
                ,)
          ),
          SizedBox(height: 4.h),
          Padding(
            padding:  EdgeInsets.only(right: 20.w,left: 20.w),
            child:  SizedBox(height: 40.h,width: 320.w,
              child: FlutterInputField(
                inputType: TextInputType.text,
                filled: true,
                fillColor: AppColors().blackColor,
                enableBorder: false,
                verticalContentPadding: 8.h,
                hintText: 'Enter Your Email ID',
                hintStyle: GoogleFonts.inriaSans(),
                suffixIcon: Image(image: AssetImage('assets/edit.png')),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(

              padding:  EdgeInsets.only(left: 30.w),
              child: GradientText(text: "Address:",fontSize: 14.sp
                ,)
          ),
          SizedBox(height: 4.h),
          Padding(
            padding:  EdgeInsets.only(right: 20.w,left: 20.w),
            child:  SizedBox(height: 70.h,width: 320.w,
              child: FlutterInputField(
                inputType: TextInputType.text,
                filled: true,
                fillColor: AppColors().blackColor,
                enableBorder: false,
                verticalContentPadding: 8.h,
                hintText: 'Enter Your Address',
                hintStyle: GoogleFonts.inriaSans(),
                suffixIcon: Image(image: AssetImage('assets/edit.png')),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 50.w, right: 50.w),
            child: SizedBox(height: 40.h,width: 320.w,
              child: GradientColoredButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationSuccessPage()));
                },
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
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow),
        borderRadius: BorderRadius.circular(10.r),
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
                  style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                ),
                SizedBox(height: 3.h),
                Text(
                  value,
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
              ],
            ),
          ),
          if (showEdit)
            Icon(Icons.edit, color: Colors.yellowAccent, size: 18.sp),
        ],
      ),
    );
  }
}















class RegistrationSuccessPage extends StatefulWidget {
  @override
  _RegistrationSuccessPageState createState() => _RegistrationSuccessPageState();
}

class _RegistrationSuccessPageState extends State<RegistrationSuccessPage>
    with TickerProviderStateMixin {
  late AnimationController _iconController;
  late AnimationController _textController;
  late AnimationController _buttonController;

  late Animation<double> _iconScaleAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _buttonFadeAnimation;



  @override
  void initState() {
    super.initState();

    _iconController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _textController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _buttonController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _iconScaleAnimation = CurvedAnimation(
      parent: _iconController,
      curve: Curves.elasticOut,
    );

    _textSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeOut,
      ),
    );

    _buttonFadeAnimation = CurvedAnimation(
      parent: _buttonController,
      curve: Curves.easeIn,
    );

    _iconController.forward();
    Future.delayed(Duration(milliseconds: 400), () => _textController.forward());
    Future.delayed(Duration(milliseconds: 800), () => _buttonController.forward());


    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottom_Navigation()),
      );
    });
  }



  @override
  void dispose() {
    _iconController.dispose();
    _textController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _iconScaleAnimation,
                child: Icon(
                  Icons.verified,
                  color: Colors.green,
                  size: 120,
                ),
              ),
              SizedBox(height: 20),
              SlideTransition(
                position: _textSlideAnimation,
                child: Column(
                  children: [
                    GradientText(text: "Request Sended",fontSize: 30,),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}