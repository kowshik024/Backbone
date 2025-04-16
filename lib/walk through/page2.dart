// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


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
    return Column(
      children: [
        Container(
          height: height * 0.85,
          width: width,
          child: Center(
            child: Image.asset('assets/image/Welcome-cuate 2.png'),
          ),
        ),
        Text(
          '"37 Years of Industry Experience!"',
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: width * 0.9,
          child: Text(
            'With 37 years of industry experience, we bring unmatched expertise and a proven track record of success. Our long-standing commitment to excellence ensures innovative solutions and exceptional results, making us a trusted leader in the field.',
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
