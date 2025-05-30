import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../../components/common/animations/animate_do.dart';
import '../../../../../../components/common/widgets/custom_text_field.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isShowPassword = false;

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    // _bloc.phoneNoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
    //  key: _bloc.formKey,
      child: Column(
        children: [
          SizedBox(height: 20.h),
          //Phone Number
          CustomFadeInRight(
            duration: 400,
            child: CustomTextField(
              filled: true,
              fillColour: const Color(0xFFF5FCF9),
              controller: TextEditingController(),
              hintText:'Phone number',
              keyboardType: TextInputType.number,
              obscureText: isShowPassword,

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
