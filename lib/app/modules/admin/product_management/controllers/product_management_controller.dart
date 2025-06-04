import 'package:get/get.dart';

class ProductManagementController extends GetxController {
  //TODO: Implement ProductManagementController

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

  final productName = ''.obs;
  final rackNumber = ''.obs;
  final shelfNumber = ''.obs;

  void updateProductLocation({
    required String newProductName,
    required String newRackNumber,
    required String newShelfNumber,
  }) {
    productName.value = newProductName;
    rackNumber.value = newRackNumber;
    shelfNumber.value = newShelfNumber;
  }
}
