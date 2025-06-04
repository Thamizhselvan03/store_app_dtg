import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../admin_main/views/widgets/drawer_admin.dart';
import '../controllers/reports_controller.dart';

class ReportsView extends GetView<ReportsController> {
  const ReportsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerAdmin(),
      appBar: AppBar(
        title: Text('Reports'),
       centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Report Type',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildReportCard(
                    context,
                    title: 'Sales Report',
                    icon: Icons.analytics,
                    color: Colors.blueAccent,
                    onTap: () {
                      // Navigate to Sales Report screen
                      // Get.to(() => SalesReportScreen());
                      // For now, just show a message
                      Get.snackbar(
                        'Report Selected',
                        'Displaying Sales Report (Placeholder)',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.blueAccent,
                        colorText: Colors.white,
                      );
                    },
                  ),
                  _buildReportCard(
                    context,
                    title: 'Inventory Report',
                    icon: Icons.inventory,
                    color: Colors.orangeAccent,
                    onTap: () {
                      // Navigate to Inventory Report screen
                      // Get.to(() => InventoryReportScreen());
                      Get.snackbar(
                        'Report Selected',
                        'Displaying Inventory Report (Placeholder)',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.orangeAccent,
                        colorText: Colors.white,
                      );
                    },
                  ),
                  _buildReportCard(
                    context,
                    title: 'Expiry Report',
                    icon: Icons.date_range,
                    color: Colors.redAccent,
                    onTap: () {
                      // Navigate to Expiry Report screen
                      // Get.to(() => ExpiryReportScreen());
                      Get.snackbar(
                        'Report Selected',
                        'Displaying Expiry Report (Placeholder)',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                      );
                    },
                  ),
                  _buildReportCard(
                    context,
                    title: 'Stock Movement',
                    icon: Icons.swap_horiz,
                    color: Colors.purpleAccent,
                    onTap: () {
                      // Navigate to Stock Movement Report screen
                      // Get.to(() => StockMovementReportScreen());
                      Get.snackbar(
                        'Report Selected',
                        'Displaying Stock Movement Report (Placeholder)',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.purpleAccent,
                        colorText: Colors.white,
                      );
                    },
                  ),
                  // Add more report types as needed
                ],
              ),
            ),
            // Area to display selected report data (replace with actual report widgets)
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.8), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40.sp,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





