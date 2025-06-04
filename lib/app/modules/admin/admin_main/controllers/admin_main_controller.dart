import 'package:get/get.dart';

import '../../../../../utils/enum/nav_bar_enum.dart';

class AdminMainController extends GetxController {
  //TODO: Implement AdminMainController

  final dawerIndex = 0.obs;
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
  Rx<NavBarEnum> selectedNavItem = NavBarEnum.home.obs;

  void changePage(NavBarEnum item) {
    selectedNavItem.value = item;
  }
}





