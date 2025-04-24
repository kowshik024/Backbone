import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,

    required this.text,
    this.fontSize,
    this.fontWeight,
    this.decoration,
    this.fontStyle,
    this.textAlign,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: AppColors().gradients,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds);
      },
      child: FlutterCustomText(
        textAlign: textAlign,
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Colors.white,
        decoration: decoration,
        fontStyle: fontStyle,

      ),
    );
  }
}