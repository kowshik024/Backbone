import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  const GradientIcon({
    super.key, required this.child,


  });
  final Widget child;


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
      child: child
    );
  }
}


