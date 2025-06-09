import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:store_app/app/components/common/widgets/text_app.dart';
import 'package:store_app/app/components/global-widgets/general_text_field.dart';
import 'package:store_app/app/components/global-widgets/my_buttons.dart';
import 'package:store_app/app/modules/admin/admin_main/views/widgets/drawer_admin.dart';

import '../controllers/product_management_controller.dart';

class ProductManagementView extends GetView<ProductManagementController> {
  const ProductManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerAdmin(),
      appBar: AppBar(title: Text('Product  Management')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 24.0),
            TextApp(text: "Product Name:", theme: context.textTheme.bodyLarge!),
            GeneralTextField(
              //   onChanged: (value) => controller.productName.value = value,
              hint: '',
              theme: context.theme,
              textEditingController: controller.productNameTC,
            ),
            TextApp(text: "Rack Number:", theme: context.textTheme.bodyLarge!),

            GeneralTextField(
              //  onChanged: (value) => controller.rackNumber.value = value,
              hint: '',
              theme: context.theme,
              textEditingController: controller.productNameTC,
            ),
            TextApp(text: "Shelf Number:", theme: context.textTheme.bodyLarge!),
            GeneralTextField(
              //  onChanged: (value) => controller.shelfNumber.value = value,
              hint: '',
              theme: context.theme,
              textEditingController: controller.productNameTC,
            ),
            TextApp(text: "Quantity:", theme: context.textTheme.bodyLarge!),
            GeneralTextField(
              //  onChanged: (value) => controller.shelfNumber.value = value,
              hint: '',
              theme: context.theme,
              textEditingController: controller.productNameTC,
            ),

            SizedBox(height: 24.0),
            PrimaryButton(
              onPressed: () {
                Get.snackbar('Update', 'Location data updated (locally)');
              },
              inactive: false,
              title: "Update",
              width: double.maxFinite,
            ),
          ],
        ),
      ),
    );
  }
}
