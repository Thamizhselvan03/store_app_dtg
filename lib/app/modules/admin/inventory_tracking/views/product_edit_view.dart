import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:store_app/app/modules/admin/inventory_tracking/controllers/inventory_tracking_controller.dart';

import '../model/product_model.dart';

class ProductEditView extends GetView {
   ProductEditView({Key? key}) : super(key: key) {
    // Initialize controllers with existing product data
    _nameController.text = product.name;
    _productIdController.text = product.productId;
    _manufacturerController.text = product.manufacturer;
    _batchNumberController.text = product.batchNumber;
    _expiryDateController.text = DateFormat(
      'yyyy-MM-dd',
    ).format(product.expiryDate); // Format date
    _purchasePriceController.text = product.purchasePrice.toString();
    _sellingPriceController.text = product.sellingPrice.toString();
    _quantityInStockController.text = product.quantityInStock.toString();
    _reorderLevelController.text = product.reorderLevel.toString();
  }

  final Product product = Get.arguments;

  // Get the controller to access update logic
  final InventoryTrackingController inventoryController = Get.find();

  // TextEditingControllers for the form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _productIdController = TextEditingController();
  final TextEditingController _manufacturerController = TextEditingController();
  final TextEditingController _batchNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _purchasePriceController =
      TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _quantityInStockController =
      TextEditingController();
  final TextEditingController _reorderLevelController = TextEditingController();

  // Function to handle saving the edited product
  void _saveChanges() {
    // Get updated data from controllers
    final updatedProduct = Product(
      name: _nameController.text,
      productId: _productIdController.text,
      manufacturer: _manufacturerController.text,
      batchNumber: _batchNumberController.text,
      expiryDate: DateFormat('yyyy-MM-dd').parse(_expiryDateController.text),
      // Parse date
      purchasePrice: double.tryParse(_purchasePriceController.text) ?? 0.0,
      // Handle potential parsing errors
      sellingPrice: double.tryParse(_sellingPriceController.text) ?? 0.0,
      quantityInStock: int.tryParse(_quantityInStockController.text) ?? 0,
      reorderLevel: int.tryParse(_reorderLevelController.text) ?? 0,
    );

    // Call the controller's update method (you'll need to add this to your InventoryController)
    inventoryController.updateProduct(product.productId, updatedProduct);

    // Navigate back to the inventory list
    Get.back();
  }

  @override
  void dispose() {
    // Dispose controllers when the page is closed
    _nameController.dispose();
    _productIdController.dispose();
    _manufacturerController.dispose();
    _batchNumberController.dispose();
    _expiryDateController.dispose();
    _purchasePriceController.dispose();
    _sellingPriceController.dispose();
    _quantityInStockController.dispose();
    _reorderLevelController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // Use ListView for scrolling if the form is long
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _productIdController,
              decoration: InputDecoration(
                labelText: 'Product ID (SKU/Barcode)',
              ),
              enabled: false, // Product ID is usually not editable
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _manufacturerController,
              decoration: InputDecoration(labelText: 'Manufacturer/Supplier'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _batchNumberController,
              decoration: InputDecoration(labelText: 'Batch Number'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _expiryDateController,
              decoration: InputDecoration(
                labelText: 'Expiry Date (YYYY-MM-DD)',
                suffixIcon: Icon(Icons.calendar_today), // Add a calendar icon
              ),
              readOnly: true, // Make the field read-only
              onTap: () async {
                // Show a date picker when the field is tapped
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateFormat(
                    'yyyy-MM-dd',
                  ).parse(_expiryDateController.text),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  _expiryDateController.text = DateFormat(
                    'yyyy-MM-dd',
                  ).format(pickedDate);
                }
              },
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _purchasePriceController,
              decoration: InputDecoration(labelText: 'Purchase Price'),
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ), // Numeric keyboard with decimal
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _sellingPriceController,
              decoration: InputDecoration(labelText: 'Selling Price'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _quantityInStockController,
              decoration: InputDecoration(labelText: 'Quantity in Stock'),
              keyboardType: TextInputType.number, // Numeric keyboard
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _reorderLevelController,
              decoration: InputDecoration(labelText: 'Reorder Level'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _saveChanges, // Call the save changes function
              child: Text('Save Changes'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                // Increase button padding
                textStyle: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
