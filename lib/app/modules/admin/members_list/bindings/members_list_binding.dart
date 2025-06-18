import 'package:get/get.dart';

import '../controllers/members_list_controller.dart';

class MembersListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MembersListController>(
      () => MembersListController(),
    );
  }
}
