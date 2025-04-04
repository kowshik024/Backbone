import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImageCard extends StatelessWidget {
  const SvgImageCard({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.color,
    this.erroIconSize,
    this.errorIconColor,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final double? erroIconSize;
  final Color? errorIconColor;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imageUrl,
      width: width,
      height: height,
      //colorFilter: ColorFilter.mode(color ?? Colors.amber, BlendMode.src),
      fit: fit ?? BoxFit.contain,
      errorBuilder: (context, object, stackTrace) {
        return SizedBox(
          child: Icon(
            Icons.error,
            color: errorIconColor ?? Colors.white,
            size: erroIconSize,
          ),
        );
      },
    );
  }
}
