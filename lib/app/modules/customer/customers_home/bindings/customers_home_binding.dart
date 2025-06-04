import 'package:get/get.dart';

import '../controllers/customers_home_controller.dart';

class CustomersHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomersHomeController>(
      () => CustomersHomeController(),
    );
  }
}
