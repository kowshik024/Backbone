import 'package:backbone/constant/app_colors.dart';
import 'package:flutter/material.dart';

class FlutterInputField extends StatelessWidget {
  const FlutterInputField({
    super.key,
    this.controller,
    required this.filled,
    required this.enableBorder,
    this.hintText,
    this.validator,
    this.onSaved,
    this.inputType,
    this.focusNode,
    this.suffixIcon,
    this.onTap,
    this.maxLines,
    this.readOnly,
    this.verticalContentPadding,
    this.obscure,
    this.textStyle,
    this.fillColor,
    this.hintStyle,
    this.prefixIcon,
    this.horizontalPadding,
    this.errorStyle,
    this.textCapitalization,
    this.textAlign,
    this.cursorColor,
    this.autoFocus,
    this.maxLength,
  });
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;
  final TextInputType? inputType;
  final bool filled;
  final Color? fillColor;
  final int? maxLines;
  final bool enableBorder;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final bool? readOnly;
  final double? verticalContentPadding;
  final double? horizontalPadding;
  final bool? obscure;
  final TextCapitalization? textCapitalization;
  final TextAlign? textAlign;
  final Color? cursorColor;
  final bool? autoFocus;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),

        gradient: LinearGradient(colors: AppColors().gradients),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors().blackColor,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: EdgeInsets.all(1),
        child: TextFormField(
          autofocus: autoFocus ?? false,
          keyboardType: inputType,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,

          controller: controller,
          focusNode: focusNode,
          validator: validator,
          onTap: onTap,
          readOnly: readOnly ?? false,
          obscureText: obscure ?? false,
          onSaved: onSaved,
          cursorColor: cursorColor ?? Colors.white,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          textAlign: textAlign ?? TextAlign.start,
          style:
          textStyle ??
              TextStyle(
                fontFamily: 'InriaSans',
                fontSize: 16,
                color: AppColors().whiteColor,
                fontWeight: FontWeight.w500,
              ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: verticalContentPadding ?? 0,
              horizontal: horizontalPadding ?? 8.0,
            ),

            hintText: hintText,
            hintStyle:
            hintStyle ??
                TextStyle(
                  fontFamily: 'InriaSans',
                  fontSize: 16,
                  color: AppColors().hintColor,
                  fontWeight: FontWeight.w300,
                ),
            counterText: '',

            border:
            enableBorder
                ? OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xff666666),
              ),
              borderRadius: BorderRadius.circular(8),
            )
                : InputBorder.none,
            enabledBorder:
            enableBorder
                ? OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.5,
                color: Color(0xff666666),
              ),
              borderRadius: BorderRadius.circular(8),
            )
                : InputBorder.none,
            focusedBorder:
            enableBorder
                ? OutlineInputBorder(
              borderSide: const BorderSide(
                width: 2,
                color: Color(0xff444444),
              ),
              borderRadius: BorderRadius.circular(8),
            )
                : InputBorder.none,
            errorStyle:
            errorStyle ??
                TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
            errorBorder:
            enableBorder
                ? OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.5,
                color: Color(0xffE54444),
              ),
              borderRadius: BorderRadius.circular(8),
            )
                : InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: filled,
            fillColor: fillColor ?? Colors.transparent,
          ),
        ),
      ),
    );
  }
}
