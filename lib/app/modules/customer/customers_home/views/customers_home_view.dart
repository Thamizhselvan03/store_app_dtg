import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/app/components/common/widgets/text_app.dart';
import 'package:store_app/app/components/global-widgets/Custom_card.dart';
import 'package:store_app/app/modules/customer/customers_home/views/widgets/cust_appbar.dart';

import '../../../../components/global-widgets/my_buttons.dart';
import '../controllers/customers_home_controller.dart';
import '../../../../components/navbar/navbar_controller.dart';

class CustomersHomeView extends GetView<CustomersHomeController> {
  const CustomersHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextApp(
                    text: "Ongoing Lists",
                    theme: context.textTheme.titleLarge!,
                  ),
                  CustomTextButton(
                    title: "View All",
                    onPressed: () {
                      final e = Get.find<NavbarController>();
                      e.selectedIndex.value = 1;
                    },
                    color: context.theme.primaryColor,
                  ),
                ],
              ),
              for (var k = 0; k < 3; k++)
                CustomCard(
                  img:
                      'https://thumbs.dreamstime.com/b/online-purchase-logo-illustration-art-isolated-background-40522313.jpg',
                  title: "Sunday Grocery",
                  desc: '15 items',
                ),
              SizedBox(height: 15.h),
              TextApp(
                text: "Recently Visited Maps",
                theme: context.textTheme.titleLarge!,
              ),
              SizedBox(height: 8.h),
              for (var k = 0; k < 2; k++)
                CustomCard(
                  img:
                      'https://thumbs.dreamstime.com/b/online-purchase-logo-illustration-art-isolated-background-40522313.jpg',
                  title: "Sunday Grocery",
                  desc: '15 items',
                ),
            ],
          ),
          // child: Column(
          //   children: [
          //     Spacer(),
          //     CachedNetworkImage(
          //       width: 180.w,
          //       imageUrl:
          //           'https://img.freepik.com/free-vector/we-are-open-concept-illustration_114360-12686.jpg?ga=GA1.1.52720250.1748611436&semt=ais_hybrid&w=740',
          //     ),
          //     SizedBox(height: 15.h),
          //     Text(
          //       'Get a clear view of the day ahead',
          //       style: context.textTheme.bodyLarge,
          //     ),
          //     SizedBox(height: 10.h),
          //     Text(
          //       'All your tasks that are due today will show \nup here',
          //       style: context.textTheme.bodyMedium!.copyWith(
          //         color: context.theme.hintColor,
          //         fontSize: 14.sp,
          //         fontWeight: FontWeight.w500,
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //     SizedBox(height: 25.h),
          //     PrimaryButtonWithIcon(
          //       onPressed: () {
          //         CustomBottomSheet.showModalBottomSheetContainer(
          //           backgroundColor: Colors.white,
          //           context: context,
          //           widget: Column(
          //             children: [
          //               Container(
          //                 width: double.maxFinite,
          //                 height: 100.h,
          //                 color: context.theme.colorScheme.secondary,
          //                 child: Icon(Icons.photo),
          //               ),
          //               SizedBox(height: 10.h),
          //               GeneralTextField(
          //                 hint: 'title',
          //                 theme: context.theme,
          //                 textEditingController: TextEditingController(),
          //               ),
          //               SizedBox(height: 15.h),
          //               PrimaryButton(
          //                 width: double.maxFinite,
          //                 title: "Submit",
          //                 onPressed: () {
          //                   Get.close(1);
          //                 },
          //                 inactive: false,
          //               ),
          //             ],
          //           ),
          //         );
          //       },
          //       title: "Create a List",
          //       inactive: false,
          //       iconData: Icons.add,
          //     ).paddingSymmetric(horizontal: 25.w),
          //     Spacer(flex: 2),
          //   ],
          // ),
        ),
      ),
    );
  }
}
