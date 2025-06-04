import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:store_app/app/components/common/widgets/text_app.dart';
import 'package:store_app/app/components/global-widgets/main_appbar.dart';
import 'package:store_app/app/components/global-widgets/my_buttons.dart';
import 'package:store_app/app/modules/customer/Cust_Grocery_list/views/widgets/grocery_tabbar.dart';
import 'package:store_app/app/modules/customer/Cust_Grocery_list/views/widgets/reorder_listview.dart';
import 'package:store_app/config/extensions/context_extensions.dart';

import '../controllers/cust_grocery_list_controller.dart';

class CustGroceryListView extends GetView<CustGroceryListController> {
  const CustGroceryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(prefixAction: () {}, title: "Grocery Lists"),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SecondaryTabbar(radius: 15.r),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: "3 Grocery Lists",
                  theme: context.textTheme.bodyLarge!.copyWith(fontSize: 14.sp),
                ),
                TextButtonWithIcon(
                  title: "Create a new List",
                  onPressed: () {},
                  iconData: Icons.add,
                ),
              ],
            ),
            Expanded(child: ReorderableListGloceryViewWidget()),
          ],
        ),
      ),
    );
  }
}
