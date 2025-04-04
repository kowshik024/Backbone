import 'dart:ui';

class AppColors {
  static final AppColors instance = AppColors._internal();

  AppColors._internal();

  factory AppColors() {
    return instance;
  }

  Color  blackColor = Color(0xff000000);

  Color  whiteColor = Color(0xffFFFFFF);

  Color  hintColor = Color(0xffFFFFFF).withOpacity(0.5);

  Color  keyboardArrow = Color(0xff333333);

  List<Color>  gradients = [
    Color(0xFFBF9347),
    Color(0xFFFBF398),
    Color(0xFFF0D571),
    Color(0xFFF9F194),
    Color(0xFFDEAB3D),

  ];
}