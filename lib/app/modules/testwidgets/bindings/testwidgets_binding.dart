import 'package:get/get.dart';

import '../controllers/testwidgets_controller.dart';

class TestwidgetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestwidgetsController>(
      () => TestwidgetsController(),
    );
  }
}
