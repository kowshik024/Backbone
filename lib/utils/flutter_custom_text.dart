import 'package:backbone/constant/app_colors.dart';
import 'package:flutter/material.dart';

class FlutterCustomText extends StatelessWidget {
  const FlutterCustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.decoration,
    this.decorationStyle,
    this.textAlign,
    this.overflow,
    this.textDirection,
    this.fontStyle,
  });

  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;
  final TextOverflow? overflow;
  final TextDirection? textDirection;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      textDirection: textDirection,
      style: TextStyle(
        fontFamily: 'InriaSans',
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.bold,
        fontStyle: fontStyle,
        color: color ?? AppColors().whiteColor,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: color,
        decorationStyle: decorationStyle,
      ),
    );
  }
}