import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/utils/image_card.dart';
import 'package:flutter/material.dart';

class GradientBorderedButton extends StatelessWidget {
  const GradientBorderedButton({
    super.key,

    required this.onTap,

    this.height,
    this.width,
    this.vertPadding,
    this.horPadding,
    required this.child,
    this.borderWidth,
    this.borderRadius,
    this.isStack,
  });

  final Widget child;
  final Function() onTap;
  final double? borderWidth;
  final double? height;
  final double? width;
  final double? vertPadding;
  final double? horPadding;
  final BorderRadius? borderRadius;
  final bool? isStack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          Ink(
            padding: EdgeInsets.all(borderWidth ?? 1),
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(8),

              gradient: LinearGradient(colors: AppColors().gradients),
            ),
            child: Ink(
              height: height ?? 41,
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
          ),
          Visibility(
            visible: isStack ?? false,
            child: Positioned(
              top: -5,
              right: -2,
              child: ImageCard(
                imageUrl: AppImages().starIcon,
                width: 21,
                height: 21,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
