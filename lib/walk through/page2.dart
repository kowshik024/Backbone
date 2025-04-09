// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/gradient_text.dart';



class Walkthrough2 extends StatelessWidget {
  final double height;
  final double width;
  const Walkthrough2({
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
              '"37 YEARS OF INDUSTRY EXPERIENCE "',style: TextStyle(color: Colors.white,fontSize: 12),

            ),
            SizedBox(
              height: 10,
            ),
            GradientText(text: "With 37 years of industry experience, we bring unmatched expertise and a proven track record of success. Our long-standing commitment to excellence ensures innovative solutions and exceptional results, making us a trusted leader in the field.",fontSize: 10,)
          ],
        ),
      ),
    );
  }
}