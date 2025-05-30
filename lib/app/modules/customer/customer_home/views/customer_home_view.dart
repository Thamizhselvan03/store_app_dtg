import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/app/modules/customer/customer_home/views/widgets/racks_list.dart';
import 'package:store_app/app/modules/customer/customer_home/views/widgets/search_products.dart';
import '../controllers/customer_home_controller.dart';

class CustomerHomeView extends GetView<CustomerHomeController> {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(5),
          ),
        ),
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search For Users
          SearchProducts(),
          SizedBox(height: 10.h),
          RackList(),
        ],
      ),
    );
  }
}
