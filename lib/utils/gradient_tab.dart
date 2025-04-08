import 'package:backbone/constant/app_colors.dart';
import 'package:flutter/material.dart';

class GradientTab extends StatelessWidget {
  const GradientTab({
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
    return TabBar(
      indicator: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        gradient: LinearGradient(colors: AppColors().gradients),

      ),
      tabs: [],
    );
  }
}

