import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:store_app/app/modules/customer/customer_products_list/views/widgets/product_search_inside_rack.dart';
import 'package:store_app/app/modules/customer/customer_products_list/views/widgets/row_wise_products.dart';

import '../../../../components/common/widgets/custom_container_linear_admin.dart';
import '../../../../components/common/widgets/custom_text_field.dart';
import '../../../../components/common/widgets/text_app.dart';
import '../controllers/customer_products_list_controller.dart';

class CustomerProductsListView extends GetView<CustomerProductsListController> {
  const CustomerProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(
            bottom: Radius.circular(5),
          ),
        ),
        title: const Text('Rack 1'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),

          ProductSearchInsideRack(),
          RowWiseProducts(),
        ],
      ),
    );
  }
}
