import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:store_app/app/modules/customer/Cust_Grocery_list_items/views/widgets/GloceryItemList.dart';
import 'package:store_app/app/routes/app_pages.dart';
import 'package:store_app/config/extensions/context_extensions.dart';

import '../../../../components/common/drawer/custom_rich_text.dart';
import '../../../../components/common/widgets/text_app.dart';
import '../../../../components/global-widgets/main_appbar.dart';
import '../../../../components/global-widgets/my_buttons.dart';
import '../../../../components/global-widgets/search_text_field.dart';
import '../controllers/cust_grocery_list_items_controller.dart';

class CustGroceryListItemsView extends GetView<CustGroceryListItemsController> {
  const CustGroceryListItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: PrimaryButton(
          title: "Start Shopping",
          onPressed: () {
            context.pushNamed(AppPages.CUSTOMER_HOME);
          },
          inactive: false,
        ),
      ),
      appBar: MainAppBar(
        prefixAction: () {
          Get.back();
        },
        title: "Sunday Lists",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 10),
            SearchTextField(
              clearing: () {},
              hint: "Add on item",
              isClearButtonVisible: false,
              isSearchButtonVisible: true,
              submit: (v) {},
              textEditingController: TextEditingController(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRichText(info: 'Shopping List', title: '14 items'),

                CustomTextButton(
                  title: "Remove All",
                  onPressed: () {},
                  color: Colors.black,
                ),
              ],
            ),
            Expanded(child: GloceryItemsListWidget()),
          ],
        ),
      ),
    );
  }
}
