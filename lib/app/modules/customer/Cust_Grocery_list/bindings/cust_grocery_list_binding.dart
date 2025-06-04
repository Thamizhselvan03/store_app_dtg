import 'package:get/get.dart';

import '../controllers/cust_grocery_list_controller.dart';

class CustGroceryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustGroceryListController>(
      () => CustGroceryListController(),
    );
  }
}
