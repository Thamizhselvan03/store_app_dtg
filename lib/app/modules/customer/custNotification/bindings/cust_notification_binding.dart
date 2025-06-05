import 'package:get/get.dart';

import '../controllers/cust_notification_controller.dart';

class CustNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustNotificationController>(
      () => CustNotificationController(),
    );
  }
}
