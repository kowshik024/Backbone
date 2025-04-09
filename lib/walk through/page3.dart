// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:backbone/login/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';
import '../utils/gradient_text.dart';



class Walkthrough3 extends StatelessWidget {
  final double height;
  final double width;
  const Walkthrough3({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 300,left: 70,right: 20),
        child: Column(
          children: [

            Text(
              '"100+ NO OF CHIT SCHEMES!"',style: TextStyle(color: Colors.white,fontSize: 12),

            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: width * 0.8,
                child:
                GradientText(text: "With 100+ successful chit schemes, we offer reliable and secure financial solutions, "
                    "helping customers achieve their goals with trust "
                    "and transparency.",fontSize: 13,) ),

          ],
        ),
      ),
    );
  }
}