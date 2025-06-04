import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:store_app/app/modules/admin/inventory_tracking/views/product_edit_view.dart';

import '../../admin_main/views/widgets/drawer_admin.dart';
import '../controllers/inventory_tracking_controller.dart';
import '../model/product_model.dart';

class InventoryTrackingView extends GetView<InventoryTrackingController> {
   InventoryTrackingView({super.key});



   void _editProduct(Product product) {
     // Navigate to the EditProductPage, passing the product as arguments
     Get.to(() => ProductEditView(), arguments: product);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerAdmin(),
      appBar: AppBar(
        title: Text('Inventory Tracking'),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.searchController, // Use the controller's TextField
              decoration: InputDecoration(
                hintText: 'Search by product name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.grey[200],
        child: Obx( // Use Obx to react to changes in observable lists
              () => ListView.builder(
            itemCount: controller.filteredProducts.length, // Use the filtered list from the controller
            itemBuilder: (context, index) {
              final product = controller.filteredProducts[index]; // Get product from the filtered list
              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      _buildDetailRow('ID:', product.productId),
                      _buildDetailRow('Manufacturer:', product.manufacturer),
                      _buildDetailRow('Batch:', product.batchNumber),
                      _buildDetailRow('Expiry Date:', product.expiryDate.toLocal().toString().split(' ')[0]),
                      _buildDetailRow('Purchase Price:', '\$${product.purchasePrice.toStringAsFixed(2)}'),
                      _buildDetailRow('Selling Price:', '\$${product.sellingPrice.toStringAsFixed(2)}'),
                      _buildDetailRow('Quantity in Stock:', product.quantityInStock.toString()),
                      _buildDetailRow('Reorder Level:', product.reorderLevel.toString()),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            tooltip: 'Edit Product',
                            onPressed: () {
                              _editProduct(product); // Call controller method
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            tooltip: 'Delete Product',
                            onPressed: () {
                              controller.deleteProduct(product); // Call controller method
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
   Widget _buildDetailRow(String label, String value) {
     return Padding(
       padding: const EdgeInsets.symmetric(vertical: 2.0), // Add vertical padding to each row
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             label,
             style: TextStyle(
               fontWeight: FontWeight.bold,
               color: Colors.blueGrey[600], // Slightly darker color for labels
             ),
           ),
           SizedBox(width: 4.0), // Spacing between label and value
           Expanded( // Allow the value to take up remaining space
             child: Text(
               value,
               style: TextStyle(
                 color: Colors.blueGrey[800], // Darker color for values
               ),
             ),
           ),
         ],
       ),
     );
   }

}


