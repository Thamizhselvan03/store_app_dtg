import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:store_app/config/extensions/context_extensions.dart';

import '../../../../../components/common/animations/animate_do.dart';
import '../../../../../components/common/style/fonts/font_weight_helper.dart';
import '../../../../../components/common/widgets/text_app.dart';

class AuthTittleInfo extends StatelessWidget {
  const AuthTittleInfo({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: Column(
        children: [
          //app logo
          Image.network(
            "https://static.vecteezy.com/system/resources/previews/008/321/373/non_2x/shopping-bag-logo-store-icon-online-shop-symbol-template-vector.jpg",
            height: 100,
          ),
          SizedBox(height: 70.h),
          //title
          TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          SizedBox(height: 10.h),
          //description
          TextApp(
            text: description,
            theme: context.textTheme.bodyMedium!.copyWith(
              fontSize: 14.sp,

              fontWeight: FontWeightHelper.medium,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
