import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/app/modules/customer/login/controllers/login_controller.dart';

import '../../../../../../components/common/animations/animate_do.dart';
import '../../../../../../components/common/widgets/custom_text_field.dart';

class LoginTextForm extends StatefulWidget {
   LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  //
  final LoginController _ctlr = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _ctlr.formKey,
      child: Column(
        children: [
          SizedBox(height: 20.h),
          //Phone Number
          CustomFadeInRight(
            duration: 400,
            child: CustomTextField(
              filled: true,
              fillColour: const Color(0xFFF5FCF9),
              controller: _ctlr.phoneNoController,
              hintText: 'Phone number',
              keyboardType: TextInputType.number,
              obscureText: false,

              validator: (value) {
                if (value == null || value.isEmpty || value.length < 10) {
                  return "Enter valid number";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
