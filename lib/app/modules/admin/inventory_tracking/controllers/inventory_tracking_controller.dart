import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';

class InventoryTrackingController extends GetxController {
  //TODO: Implement InventoryTrackingController
  @override
  void onInit() {
    super.onInit();
    // Initialize the filtered list with all products
    filteredProducts.assignAll(_allProducts);
    // Add a listener to the search controller
    searchController.addListener(_filterProducts);
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    // Clean up the controller
    searchController.dispose();
    super.onClose();
  }



  final _allProducts = <Product>[
    Product(
      name: 'Product A',
      productId: 'PA001',
      manufacturer: 'Manufacturer X',
      batchNumber: 'BATCH123',
      expiryDate: DateTime(2025, 12, 31),
      purchasePrice: 10.0,
      sellingPrice: 15.0,
      quantityInStock: 50,
      reorderLevel: 10,
    ),
    Product(
      name: 'Product B',
      productId: 'PB002',
      manufacturer: 'Manufacturer Y',
      batchNumber: 'BATCH456',
      expiryDate: DateTime(2024, 11, 15),
      purchasePrice: 20.0,
      sellingPrice: 28.0,
      quantityInStock: 5,
      reorderLevel: 10,
    ),
    Product(
      name: 'Product C',
      productId: 'PC003',
      manufacturer: 'Manufacturer Z',
      batchNumber: 'BATCH789',
      expiryDate: DateTime(2026, 01, 20),
      purchasePrice: 5.0,
      sellingPrice: 8.0,
      quantityInStock: 100,
      reorderLevel: 20,
    ),
    Product(
      name: 'Another Product',
      productId: 'AP001',
      manufacturer: 'Manufacturer A',
      batchNumber: 'BATCHABC',
      expiryDate: DateTime(2025, 05, 10),
      purchasePrice: 12.0,
      sellingPrice: 18.0,
      quantityInStock: 30,
      reorderLevel: 5,
    ),
  ].obs; // Make the list observable

  // The list of products currently being displayed (filtered list)
  RxList<Product> filteredProducts = <Product>[].obs; // Make the filtered list observable

  // TextEditingController for the search input
  final TextEditingController searchController = TextEditingController();



  // Function to filter the products
  void _filterProducts() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      // If the query is empty, show all products
      filteredProducts.assignAll(_allProducts);
    } else {
      // Filter the products based on the query
      filteredProducts.assignAll(_allProducts.where((product) {
        return product.name.toLowerCase().contains(query);
        // Add more filtering criteria here if needed
      }).toList());
    }
  }

  // Placeholder functions for edit and delete
  void editProduct(Product product) {
    print('Edit product: ${product.name}');
    // Implement edit logic
  }

  void deleteProduct(Product product) {
    print('Delete product: ${product.name}');
    // Implement delete logic
  }
  // Inside your InventoryController class

  void updateProduct(String productId, Product updatedProduct) {
    // Find the index of the product to update
    final index = _allProducts.indexWhere((product) => product.productId == productId);

    if (index != -1) {
      // Update the product in the original list
      _allProducts[index] = updatedProduct;

      // Re-filter the list to update the UI
      _filterProducts();

      // You might want to show a success message here
      Get.snackbar(
        'Success',
        'Product updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      // Show an error message if product not found
      Get.snackbar(
        'Error',
        'Product not found',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

}



