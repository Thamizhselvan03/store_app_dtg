import 'package:flutter/material.dart';
import 'package:get/get.dart';


// Profile Controller
class ProfileController extends GetxController {
  // Reactive profile data
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

// User Profile Screen
class UserProfileScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(profileController.isEditing.value ? 'Edit Profile' : 'User Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          Obx(() {
            if (profileController.isEditing.value) {
              return Row(
                children: [
                  TextButton.icon(
                    onPressed: () => profileController.toggleEdit(),
                    icon: Icon(Icons.save, color: Colors.white),
                    label: Text('Save', style: TextStyle(color: Colors.white)),
                  ),
                  TextButton.icon(
                    onPressed: () => profileController.toggleEdit(),
                    icon: Icon(Icons.cancel, color: Colors.white),
                    label: Text('Cancel', style: TextStyle(color: Colors.white)),
                  ),
                ],
              );
            } else {
              return IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => profileController.toggleEdit(),
              );
            }
          }),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Obx(() {
          final c = profileController;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(c.profileImageUrl.value),
                    ),
                    if (c.isEditing.value)
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: GestureDetector(
                          onTap: () => c.pickImage(),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey.shade200,
                            child: Icon(Icons.camera_alt, color: Colors.black),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // User Info Fields
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Full Name
                    TextFormField(
                      controller: c.fullNameController,
                      decoration: InputDecoration(
                        labelText: 'Full Name *',
                        border: OutlineInputBorder(),
                      ),
                      enabled: c.isEditing.value,
                      validator: (v) => v == null || v.isEmpty ? 'Enter full name' : null,
                    ),
                    SizedBox(height: 10),
                    // Email
                    TextFormField(
                      controller: c.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address *',
                        border: OutlineInputBorder(),
                      ),
                      enabled: c.isEditing.value,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Enter email';
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) return 'Invalid email';
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    // Phone
                    TextFormField(
                      controller: c.phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number *',
                        border: OutlineInputBorder(),
                      ),
                      enabled: c.isEditing.value,
                      validator: (v) => v == null || v.isEmpty ? 'Enter phone' : null,
                    ),
                    SizedBox(height: 10),
                    // Role / User Type (Dropdown)
                    InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Role / User Type',
                        border: OutlineInputBorder(),
                      ),
                      child: c.isEditing.value
                          ? DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: c.role.value,
                          items: ['User', 'Admin', 'Moderator']
                              .map((role) => DropdownMenuItem(
                            value: role,
                            child: Text(role),
                          ))
                              .toList(),
                          onChanged: (val) {
                            if (val != null) c.role.value = val;
                          },
                        ),
                      )
                          : Text(c.role.value),
                    ),
                    SizedBox(height: 10),
                    // Status Badge / Switch
                    Row(
                      children: [
                        Text('Status: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        c.isEditing.value
                            ? Switch(
                          value: c.isActive.value,
                          onChanged: (val) => c.isActive.value = val,
                        )
                            : Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: c.isActive.value ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            c.isActive.value ? 'Active' : 'Inactive',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Registration Date
                    TextFormField(
                      initialValue: c.registrationDate.value.toLocal().toString().split(' ')[0],
                      decoration: InputDecoration(
                        labelText: 'Registration Date',
                        border: OutlineInputBorder(),
                      ),
                      enabled: false,
                    ),
                    SizedBox(height: 10),
                    // Last Login
                    TextFormField(
                      initialValue: c.lastLogin.value.toLocal().toString().split(' ')[0],
                      decoration: InputDecoration(
                        labelText: 'Last Login',
                        border: OutlineInputBorder(),
                      ),
                      enabled: false,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              // Additional Details
              Text('Additional Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              // Address
              TextFormField(
                controller: c.addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                enabled: c.isEditing.value,
              ),
              SizedBox(height: 10),
              // Date of Birth
              GestureDetector(
                onTap: c.isEditing.value ? () => c.selectDate(context) : null,
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: c.dobController,
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    enabled: c.isEditing.value,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Notes
              TextFormField(
                controller: c.notesController,
                decoration: InputDecoration(
                  labelText: 'Notes / Description',
                  border: OutlineInputBorder(),
                ),
                enabled: c.isEditing.value,
                maxLines: 3,
              ),
              SizedBox(height: 20),

              // Action Buttons
              if (c.isEditing.value)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () => c.toggleEdit(),
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add validation if needed
                        c.toggleEdit();
                      },
                      child: Text('Save'),
                    ),
                  ],
                )
              else
              // Activate / Deactivate toggle
                Obx(() => SwitchListTile(
                  title: Text(c.isActive.value ? 'Deactivate User' : 'Activate User'),
                  value: c.isActive.value,
                  onChanged: (val) => c.isActive.value = val,
                )),
            ],
          );
        }),
      ),
    );
  }
}