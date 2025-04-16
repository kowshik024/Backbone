// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


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
    return Column(
      children: [
        Container(
          height: height * 0.9,
          width: width,
          child: Center(
            child: Image.asset('assets/image/Welcome-cuate 3.png'),
          ),
        ),
        Text(
          '"100+ No. of Chit Schemes!"',
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: width * 0.8,
          child: Text(
            'With 100+ successful chit schemes, we offer reliable and secure financial solutions, helping customers achieve their goals with trust and transparency.',
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
