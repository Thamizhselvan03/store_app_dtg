import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:store_app/app/components/common/dialogs/custom_dialogs.dart';
import 'package:store_app/app/components/global-widgets/Custom_card.dart';

class QrScannerController extends GetxController {
  //TODO: Implement QrScannerController

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


  var scannedCode = ''.obs;

  void setScannedCode(String code) {
    scannedCode.value = code;
  }
}
