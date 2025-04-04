import 'package:backbone/utils/svg_image.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.url, required this.onTap});

  final String url;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: SvgImageCard(imageUrl: url));
    // return Padding(
    //   padding: EdgeInsets.only(left: spacingLeft ?? 28.w),
    //   child: GestureDetector(onTap: onTap, child: SvgImageCard(imageUrl: url)),
    // );
  }
}
