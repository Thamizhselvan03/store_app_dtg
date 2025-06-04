import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:store_app/app/modules/admin/admin_main/views/widgets/drawer_admin.dart';

import '../controllers/product_management_controller.dart';

class ProductManagementView extends GetView<ProductManagementController> {
  const ProductManagementView({super.key});
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      drawer: DrawerAdmin(),
      appBar: AppBar(
        title: Text('Product Location Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text('Product Name: ${controller.productName.value}')),
            SizedBox(height: 16.0),
            Obx(() => Text('Rack Number: ${controller.rackNumber.value}')),
            SizedBox(height: 16.0),
            Obx(() => Text('Shelf Number: ${controller.shelfNumber.value}')),
            SizedBox(height: 24.0),
            TextField(
              onChanged: (value) => controller.productName.value = value,
              decoration: InputDecoration(labelText: 'Update Product Name'),
            ),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) => controller.rackNumber.value = value,
              decoration: InputDecoration(labelText: 'Update Rack Number'),
            ),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) => controller.shelfNumber.value = value,
              decoration: InputDecoration(labelText: 'Update Shelf Number'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // In a real application, you would likely call a method
                // in the controller to save or process the updated data.
                // For this example, we are just updating the observables directly
                // via the onChanged callbacks in the TextFields.
                // If your controller had an update method like:
                // controller.updateLocation(productName.value, rackNumber.value, shelfNumber.value);
                // You would call it here.
                Get.snackbar('Update', 'Location data updated (locally)');
              },
              child: Text('Update Location'),
            ),
          ],
        ),
      ),
    );
  }
}







