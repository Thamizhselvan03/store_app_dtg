import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../admin_main/views/widgets/drawer_admin.dart';
import '../controllers/sales_history_controller.dart';

class SalesHistoryView extends GetView<SalesHistoryController> {
  const SalesHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return      Scaffold(
      drawer: DrawerAdmin(),
      appBar: AppBar(
        title: const Text('Sales History'),
        backgroundColor: context.theme.primaryColor,
        elevation: 4.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Sales...',
                prefixIcon: const Icon(Icons.search, color: Colors.teal),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (value) {
                controller.filterSalesHistory(value);
              },
            ),
          ),
          Expanded(
            child: Obx(
                  () {
                if (controller.filteredSalesHistory.isEmpty) {
                  return const Center(child: Text('No sales records found.'));
                } else {
                  return ListView.builder(
                    itemCount: controller.filteredSalesHistory.length,
                    itemBuilder: (context, index) {
                      final sale = controller.filteredSalesHistory[index];
                      return GestureDetector(
                        onTap: () {
                          // TODO: Implement navigation to detailed sale view
                          Get.snackbar(
                            'Sale Details',
                            'Tapped on Sale ID: ${sale.id}',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.teal,
                            colorText: Colors.white,
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sale ID: ${sale.id}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Colors.teal,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  'Date: ${DateFormat('yyyy-MM-dd HH:mm').format(sale.date)}',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  'Total Amount: \$${sale.totalAmount.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
