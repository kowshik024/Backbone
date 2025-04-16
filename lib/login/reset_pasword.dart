import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/login_screen.dart';
import 'package:backbone/utils/action_button.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:backbone/utils/flutter_input_field.dart';
import 'package:backbone/utils/gradient_coloured_button.dart';
import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:backbone/utils/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasword extends StatefulWidget {
  const ResetPasword({super.key});

  @override
  State<ResetPasword> createState() => _ResetPaswordState();
}

class _ResetPaswordState extends State<ResetPasword> {

  final TextEditingController enternewPasswordController = TextEditingController();
  final TextEditingController ConformnewPasswordController = TextEditingController();

  bool isPasswordObscure = true;
  bool isConformnewpasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: ActionButton(
          url: AppImages().backIcon,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    text: 'Welcome to',
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  GradientText(
                    text: 'Backbone Chit Funds',
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            ImageCard(
              imageUrl: AppImages().goldTree,
              width: 184.w,
              height: 150.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 44.h,width: 320.w,
              child: FlutterInputField(
                controller: enternewPasswordController,
                inputType: TextInputType.text,
                filled: true,
                fillColor: AppColors().blackColor,
                enableBorder: false,
                obscure: isPasswordObscure,
                hintText: 'Enter New Password',
                suffixIcon: IconButton(
                  icon: GradientIcon(
                    child:  isPasswordObscure
                        ? Icon(Icons.visibility_off_outlined,color: AppColors().whiteColor )
                        : Icon(Icons.visibility_outlined,color: AppColors().whiteColor,),
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordObscure = !isPasswordObscure;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            SizedBox(height: 44.h,width: 320.w,
              child: FlutterInputField(
                controller: ConformnewPasswordController,
                inputType: TextInputType.text,
                filled: true,
                fillColor: AppColors().blackColor,
                enableBorder: false,
                obscure: isConformnewpasswordObscure,
                hintText: 'Conform New Password',
                suffixIcon: IconButton(
                  icon: GradientIcon(
                    child:  isConformnewpasswordObscure
                        ? Icon(Icons.visibility_off_outlined,color: AppColors().whiteColor )
                        : Icon(Icons.visibility_outlined,color: AppColors().whiteColor,),
                  ),
                  onPressed: () {
                    setState(() {
                      isConformnewpasswordObscure = !isConformnewpasswordObscure;
                    });
                  },
                ),
              ),
            ),
        SizedBox(height: 50.h),
        SizedBox(height: 44.h,width: 320.w,
          child: GradientColoredButton(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen()));
            },
            child: FlutterCustomText(
              text: 'Reset Password',
              color: AppColors().blackColor,
            ),
          ),
        ),
          ]
        ),
      ),
    );
  }
}
