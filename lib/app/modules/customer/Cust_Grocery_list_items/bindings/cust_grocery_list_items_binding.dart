import 'package:get/get.dart';

import '../controllers/cust_grocery_list_items_controller.dart';

class CustGroceryListItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustGroceryListItemsController>(
      () => CustGroceryListItemsController(),
    );
  }
}
