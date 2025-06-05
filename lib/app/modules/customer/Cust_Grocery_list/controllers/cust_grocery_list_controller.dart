import 'package:get/get.dart';

class CustGroceryListController extends GetxController {
  //TODO: Implement CustGroceryListController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  RxInt selectedIndex = 0.obs;
}
