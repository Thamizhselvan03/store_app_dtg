import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/app/components/common/style/fonts/font_family_helper.dart';
import 'package:store_app/app/components/common/style/fonts/font_weight_helper.dart';

class CustomRichText extends StatelessWidget {
  final String info;
  final String title;

  const CustomRichText({super.key, required this.info, required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$info   ',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontFamily: FontFamilyHelper.poppinsEnglish,
        ),
        children: [
          TextSpan(
            text: title,
            style:  TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              color: context.theme.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
