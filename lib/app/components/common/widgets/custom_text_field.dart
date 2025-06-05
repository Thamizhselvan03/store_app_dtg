import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    this.filled = false,
    this.obscureText = false,
    this.readOnly = false,
    super.key,
    this.validator,
    this.fillColour,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.hintStyle,
    this.overrideValidator = false,
    this.prefixIcon,
    this.onChanged,
    this.maxLength,
    this.maxLines = 1,
  });

  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final TextEditingController controller;
  final bool filled;
  final Color? fillColour;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final TextStyle? hintStyle;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      style: context.textTheme.bodyMedium!.copyWith(
        fontSize: 14.sp,

        // fontWeight: FontWeight.w500,
        // color: context.color.textColor,
      ),
      validator: (value) {
        return validator!(value);
      },
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      readOnly: readOnly,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        filled: filled,
        fillColor: fillColour,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle:
            hintStyle ??
            context.textTheme.bodyMedium!.copyWith(
              // color: context.color.textColor,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
        errorStyle: context.textTheme.bodyMedium!.copyWith(
          color: Colors.red,
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
