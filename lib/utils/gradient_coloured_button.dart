import 'package:backbone/constant/app_colors.dart';
import 'package:flutter/material.dart';


class GradientColoredButton extends StatelessWidget {
  const GradientColoredButton({
    super.key,

    required this.onTap,

    this.height,
    this.width,
    this.vertPadding,
    this.horPadding,
    required this.child,
    this.borderRadius,

  });

  final Function() onTap;
  final Widget child;
  final double? height;
  final double? width;
  final double? vertPadding;
  final double? horPadding;
  final BorderRadius? borderRadius;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: height ,
        width: width,

        padding: EdgeInsets.symmetric(
          vertical: vertPadding ?? 4,
          horizontal: horPadding ?? 12,
        ),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(8),

          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: AppColors().gradients,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
