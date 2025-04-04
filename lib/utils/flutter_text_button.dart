import 'package:flutter/material.dart';

class FlutterTextButton extends StatelessWidget {
  const FlutterTextButton({
    super.key,
    required this.onPresssed,

    this.icon,
    this.iconAlignment,
    this.textStyle,
    required this.child,
    this.color,
  });

  final Function() onPresssed;

  final Color? color;
  final Widget child;
  final Widget? icon;
  final IconAlignment? iconAlignment;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPresssed,

      style: TextButton.styleFrom(
        foregroundColor: color,
        padding: EdgeInsets.zero,

        overlayColor: Colors.transparent,
      ),
      label: child,
      icon: icon,

      iconAlignment: iconAlignment,
    );
  }
}
