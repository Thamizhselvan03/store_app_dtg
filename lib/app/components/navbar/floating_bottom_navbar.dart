// ignore_for_file: no_leading_underscores_for_local_identifiers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import 'navbar_controller.dart';

class FloatingBottomNavbar extends GetView<NavbarController> {
  const FloatingBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Obx(() => controller.navigation[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Stack(
          children: [
            Positioned(
              bottom: 35.h,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 75.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.secondary.withOpacity(1),
                      spreadRadius: 0,
                      blurRadius: 10.r,
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 60.w),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 75.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// Home
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40.h,
                            width: 40.w,
                            child: IconButton(
                              hoverColor: Colors.transparent,
                              onPressed: () {
                                controller.onTap(0);
                              },
                              icon: Icon(
                                controller.selectedIndex.value == 0
                                    ? IconlyBold.home
                                    : IconlyLight.home,
                                color: context.iconColor,
                                size: 25.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.sp),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.selectedIndex.value == 0
                                  ? context.iconColor
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),

                      /// List
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40.h,
                            width: 40.w,
                            child: IconButton(
                              hoverColor: Colors.transparent,
                              onPressed: () {
                                controller.onTap(1);
                              },
                              icon: Icon(
                                controller.selectedIndex.value == 1
                                    ? Icons.shopping_bag
                                    : IconlyLight.bag,
                                color: context.iconColor,
                                size: 25.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.sp),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.selectedIndex.value == 1
                                  ? context.iconColor
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),

                      /// Scan
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40.h,
                            width: 40.w,
                            child: IconButton(
                              hoverColor: Colors.transparent,
                              onPressed: () {
                                controller.onTap(2);
                              },
                              icon: Icon(
                                controller.selectedIndex.value == 2
                                    ? IconlyBold.scan
                                    : IconlyLight.scan,
                                color: context.iconColor,
                                size: 25.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.sp),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.selectedIndex.value == 2
                                  ? context.iconColor
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),

                      /// Scan
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40.h,
                            width: 40.w,
                            child: IconButton(
                              hoverColor: Colors.transparent,
                              onPressed: () {
                                controller.onTap(3);
                              },
                              icon: Icon(
                                controller.selectedIndex.value == 3
                                    ? IconlyBold.setting
                                    : IconlyLight.setting,
                                color: context.iconColor,
                                size: 25.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.sp),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.selectedIndex.value == 3
                                  ? context.iconColor
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
