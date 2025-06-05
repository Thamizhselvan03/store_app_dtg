import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:store_app/app/components/global-widgets/main_appbar.dart';
import 'package:store_app/app/components/global-widgets/my_buttons.dart';
import 'package:store_app/app/routes/app_pages.dart';
import 'package:store_app/config/extensions/context_extensions.dart';

import '../controllers/cust_notification_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../components/common/widgets/text_app.dart';

class CustNotificationView extends GetView<CustNotificationController> {
  const CustNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        prefixAction: () {
          Get.close(1);
        },
        title: "Notification",
        suffix: [
          CustomTextButton(
            title: "Clear All",
            onPressed: () {

            },
            color: context.theme.primaryColor,
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 2),
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              minTileHeight: 52,

              dense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 5,
              ),
              leading: CachedNetworkImage(
                height: 45,
                width: 45.w,
                imageUrl:
                    'https://5.imimg.com/data5/AK/RA/MY-68428614/apple-1000x1000.jpg',
              ),
              title: TextApp(
                text: "Shop name",
                theme: context.textTheme.bodyLarge!.copyWith(
                  color: Colors.black,

                  fontSize: 14.sp,
                ),
              ),
              subtitle: TextApp(
                text: "Flat 5% offer",
                theme: context.textTheme.bodyLarge!.copyWith(
                  color: context.theme.hintColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.close, weight: .8, size: 20.sp),
                color: context.theme.hintColor,
              ),
              tileColor: Colors.white,
              iconColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      ),
    );
  }
}
