import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingExtension on BuildContext {
  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: 20.w);

  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: 20.h);

  SizedBox verticalSpacing(double value) => SizedBox(height: value);

  SizedBox horizontalSpacing(double value) => SizedBox(width: value);
}
