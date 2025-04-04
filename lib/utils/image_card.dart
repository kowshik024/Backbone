import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.erroIconSize,
    this.errorIconColor,
    this.fit,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final double? erroIconSize;
  final Color? errorIconColor;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, object, stackTrace) {
        return SizedBox(
          child: Icon(Icons.image, size: erroIconSize, color: errorIconColor),
        );
      },
    );
  }
}
