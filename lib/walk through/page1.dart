// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    return Column(
      children: [
        Container(
          height: height * 0.9,
          width: width,
          child: Center(
            child: Image.asset('assets/image/Welcome-cuate 1.png'),
          ),
        ),
        Text(
          '"Trusted by 1500+ Happy Clients!"',
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: width * 0.8,
          child: Text(
            '"Over 1500 happy clients trust us to deliver seamless and exceptional experiences. Join them and achieve your goals with ease!"',
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
