import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestwidgetsController extends GetxController {
  //TODO: Implement TestwidgetsController
  var fullName = 'John Doe'.obs;
  var email = 'john.doe@example.com'.obs;
  var phone = '+1234567890'.obs;
  var role = 'User'.obs;
  var isActive = true.obs;
  var registrationDate = DateTime(2021, 1, 15).obs;
  var lastLogin = DateTime(2023, 8, 20).obs;
  var address = '123 Main Street, City, Country'.obs;
  var dob = DateTime(1990, 5, 20).obs;
  var notes = 'Sample notes about user'.obs;
  var profileImageUrl = 'https://via.placeholder.com/150'.obs;
  var isEditing = false.obs;

  // Text controllers for form fields
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController dobController;
  late TextEditingController notesController;

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers with current data
    fullNameController = TextEditingController(text: fullName.value);
    emailController = TextEditingController(text: email.value);
    phoneController = TextEditingController(text: phone.value);
    addressController = TextEditingController(text: address.value);
    dobController = TextEditingController(text: dob.value.toLocal().toString().split(' ')[0]);
    notesController = TextEditingController(text: notes.value);
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    dobController.dispose();
    notesController.dispose();
    super.onClose();
  }

  void toggleEdit() {
    if (isEditing.value) {
      // Save data if validation passes
      // Here, you could add validation before saving
      fullName.value = fullNameController.text;
      email.value = emailController.text;
      phone.value = phoneController.text;
      address.value = addressController.text;
      notes.value = notesController.text;
      // Save other fields as needed
    } else {
      // When entering edit mode, update controllers
      fullNameController.text = fullName.value;
      emailController.text = email.value;
      phoneController.text = phone.value;
      addressController.text = address.value;
      notesController.text = notes.value;
      dobController.text = dob.value.toLocal().toString().split(' ')[0];
    }
    isEditing.value = !isEditing.value;
  }

  Future<void> pickImage() async {
    // Placeholder: simulate image change
    profileImageUrl.value =
    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d';
  }

  Future<void> selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: dob.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      dob.value = picked;
      dobController.text = picked.toLocal().toString().split(' ')[0];
    }
  }
}