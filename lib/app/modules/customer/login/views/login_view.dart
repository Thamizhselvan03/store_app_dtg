import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:store_app/app/modules/customer/login/views/widgets/auth_title_info.dart';
import 'package:store_app/app/modules/customer/login/views/widgets/login/login_button.dart';
import 'package:store_app/app/modules/customer/login/views/widgets/login/login_text_form.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return   Scaffold(body: SafeArea(bottom: false, child: Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            // Welcome Info
            AuthTittleInfo(
              title: "Login",
              description: "Welcome, Please enter your phone number and get started.",
            ),
            SizedBox(height: 30.h),
            // Login TextForm
            const LoginTextForm(),
            SizedBox(height: 30.h),
            // Login Button
            const LoginButton(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    )));
  }
}
