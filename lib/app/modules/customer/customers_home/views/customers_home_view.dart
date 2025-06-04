import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:store_app/app/modules/customer/customers_home/views/widgets/cust_appbar.dart';

import '../../../../components/global-widgets/my_buttons.dart';
import '../controllers/customers_home_controller.dart';

class CustomersHomeView extends GetView<CustomersHomeController> {
  const CustomersHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Spacer(),
              CachedNetworkImage(
                width: 180.w,
                imageUrl:
                    'https://img.freepik.com/free-vector/we-are-open-concept-illustration_114360-12686.jpg?ga=GA1.1.52720250.1748611436&semt=ais_hybrid&w=740',
              ),
              SizedBox(height: 15.h),
              Text(
                'Get a clear view of the day ahead',
                style: context.textTheme.bodyLarge,
              ),
              SizedBox(height: 10.h),
              Text(
                'All your tasks that are due today will show \nup here',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.theme.hintColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25.h),
              PrimaryButtonWithIcon(
                onPressed: () {},
                title: "Create a List",
                inactive: false,
                iconData: Icons.add,
              ).paddingSymmetric(horizontal: 25.w),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
