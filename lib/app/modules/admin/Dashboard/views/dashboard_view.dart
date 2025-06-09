import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:store_app/app/components/common/widgets/text_app.dart';

import '../../admin_main/views/widgets/drawer_admin.dart';
import '../controllers/dashboard_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerAdmin(),
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      //  leading: Icon(Icons.menu, color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: context.theme.primaryColor,
                  child: Icon(Icons.person_2_outlined, color: Colors.white),
                ),
                CircleAvatar(
                  child: Icon(Icons.list_alt, color: Colors.white),
                  radius: 30.r,
                  backgroundColor: context.theme.primaryColor,
                ),
                CircleAvatar(
                  child: Icon(Icons.notifications_none, color: Colors.white),
                  radius: 30.r,
                  backgroundColor: context.theme.primaryColor,
                ),



                CircleAvatar(
                  child: Icon(Icons.settings, color: Colors.white),
                  radius: 30.r,
                  backgroundColor: context.theme.primaryColor,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 165.w,

                  height: 100.w,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      TextApp(
                        text: "Total Racks ",
                        theme: context.textTheme.bodyLarge!,
                      ),
                      Spacer(),
                      TextApp(
                        text: "60",
                        theme: context.textTheme.headlineSmall!.copyWith(
                          color: context.theme.primaryColor,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Container(
                  width: 165.w,

                  height: 100.w,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      TextApp(
                        text: "Total customer ",
                        theme: context.textTheme.bodyLarge!,
                      ),
                      Spacer(),
                      TextApp(
                        text: "150",
                        theme: context.textTheme.headlineSmall!.copyWith(
                          color: context.theme.primaryColor,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
