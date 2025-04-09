// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';



class Walkthrough1 extends StatelessWidget {
  final double height;
  final double width;
  const Walkthrough1({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 300,left: 70,right: 50),
        child: Column(
          children: [

            Text(
              '"Trusted by 1500+ Happy Clients!"',style: TextStyle(color: Colors.white,fontSize: 10),

            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width * 0.8,
              child:
        GradientText(text: "Over 1500 happy clients "
            "trust us to deliver seamless and exceptional "
            "experiences. Join them and achieve your "
            "goals with ease!",fontSize: 13,)),



          ],
        ),
      ),
    );
  }
}

