import 'package:backbone/constant/app_images.dart';
import 'package:backbone/utils/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class My_Chit_Plans extends StatefulWidget {
  const My_Chit_Plans({super.key});

  @override
  State<My_Chit_Plans> createState() => _My_Chit_PlansState();
}

class _My_Chit_PlansState extends State<My_Chit_Plans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 24.sp,)),
        title: Text("Chit Plans",style: GoogleFonts.inriaSans(fontSize: 20.sp,color: Colors.white),),
        actions: [ActionButton(url: AppImages().bellIcon, onTap: () {}),],
      ),
    );
  }
}
