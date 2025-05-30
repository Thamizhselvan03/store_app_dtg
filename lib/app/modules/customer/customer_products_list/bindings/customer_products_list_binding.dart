import 'package:get/get.dart';

import '../controllers/customer_products_list_controller.dart';

class CustomerProductsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerProductsListController>(
      () => CustomerProductsListController(),
    );
  }
}
