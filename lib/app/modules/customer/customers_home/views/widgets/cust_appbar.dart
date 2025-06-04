import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Today',
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.black.withValues(alpha: .7),
              ),
            ),
            SizedBox(width: 8.w),
            Text('17th Jan', style: context.textTheme.bodyLarge),
          ],
        ),
        Text('Hi, yyyy'),
      ],
    ),
    titleTextStyle: context.textTheme.bodyLarge!.copyWith(fontSize: 16.sp),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Get.isDarkMode ? Iconsax.notification5 : Iconsax.notification4,
          color: Colors.black,
        ),
      ),
    ],
  );
}
