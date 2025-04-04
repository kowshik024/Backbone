import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/login_screen.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:backbone/utils/gradient_border_color.dart';
import 'package:backbone/utils/gradient_coloured_button.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:backbone/utils/image_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({super.key});

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().blackColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    text: "Welcome to",
                    fontSize: 35,
                    fontWeight: FontWeight.w300,
                  ),
                  GradientText(
                    text: "Backbone Chit Funds",
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            ImageCard(
              imageUrl: AppImages().goldTree,
              width: 360,
              height: 313,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 60),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 44,width: 260,
                    child: GradientColoredButton(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen()));
                      },
                      child: FlutterCustomText(
                        text: 'Login',
                        color: AppColors().blackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("(or)",style: GoogleFonts.inriaSans(fontSize: 16,color: Colors.white),),
                  SizedBox(height: 10),
                  SizedBox(height:44,width: 260,
                    child: GradientBorderedButton(
                      onTap: () {
                        //Get.toNamed(AppRoutes.loginScreen);
                      },
                      child: GradientText(text: 'Enquiry'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
