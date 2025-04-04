import 'package:backbone/constant/app_colors.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,

    this.height,
    this.width,
    this.vertPadding,
    this.horPadding,
    required this.child,
    this.borderWidth,
    this.borderRadius,
  });

  final Widget child;

  final double? borderWidth;
  final double? height;
  final double? width;
  final double? vertPadding;
  final double? horPadding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(borderWidth ?? 1),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(8),

        gradient: LinearGradient(colors: AppColors().gradients),
      ),
      child: Container(
        height: height,
        width: width,

        padding: EdgeInsets.symmetric(
          vertical: vertPadding ?? 4,
          horizontal: horPadding ?? 12,
        ),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(8),

          color: AppColors().blackColor,
        ),
        child: Center(child: child),
      ),
    );
  }
}
