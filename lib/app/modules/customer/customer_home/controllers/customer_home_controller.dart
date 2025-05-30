import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class CustomerHomeController extends GetxController {
  //TODO: Implement CustomerHomeController

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
    searchController.dispose();
    super.onClose();
  }
  final SpeechToText _speech = SpeechToText();
  final TextEditingController searchController = TextEditingController();
  var isListening = false.obs;

  Future<void> startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) => isListening.value = status == "listening",
      onError: (error) => print("Error: $error"),

    );

    if (available) {
      _speech.listen(
        onResult: (result) {
          String spoken = result.recognizedWords;
          spoken = spoken.replaceAll(' ', ',');
          searchController.text = spoken;
          searchController.selection = TextSelection.fromPosition(
            TextPosition(offset: searchController.text.length),
          );
        },
      );
    }
  }

  void stopListening() {
    _speech.stop();
    isListening.value = false;
  }

}
