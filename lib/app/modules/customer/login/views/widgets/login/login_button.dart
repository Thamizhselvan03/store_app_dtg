import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/app/modules/customer/login/views/widgets/otp_screen.dart';

import 'package:store_app/config/extensions/context_extensions.dart';

import '../../../../../../components/common/animations/animate_do.dart';
import '../../../../../../components/common/style/fonts/font_weight_helper.dart';
import '../../../../../../components/common/toast/show_toast.dart';
import '../../../../../../components/common/widgets/custom_linear_button.dart';
import '../../../../../../components/common/widgets/text_app.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../controllers/login_controller.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: CustomLinearButton(
        width: MediaQuery.of(context).size.width,
        height: 50.w,
        onPressed: () {
          _validateThenDoLogin(context);
        },
        child: TextApp(
          text: "Send OTP",
          theme: context.textTheme.displaySmall!.copyWith(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
      ),

      // child: BlocConsumer<AuthBloc, AuthState>(
      //   listener: (context, state) {
      //     // state.whenOrNull(
      //     //   success: (userRole) {
      //     //     // ShowToast.showToastErrorTop(
      //     //     //   message: context.translate(LangKeys.loggedSuccessfully),
      //     //     // );
      //     //     // if (userRole == 'admin') {
      //     //     //   context.pushNamedAndRemoveUntil(AppRoutes.homeAdmin);
      //     //     // } else {
      //     //     //   context.pushNamedAndRemoveUntil(AppRoutes.homeCustomer);
      //     //     // }
      //     //   },
      //     //   error: (message) {
      //     //     ShowToast.showToastErrorTop(message: context.translate(message));
      //     //   },
      //     // );
      //   },
      //   builder: (context, state) {
      //     return state.maybeWhen(
      //       loading: () {
      //         return CustomLinearButton(
      //           width: MediaQuery.of(context).size.width,
      //           height: 50.w,
      //           onPressed: () {},
      //           child: const CircularProgressIndicator(color: Colors.white),
      //         );
      //       },
      //       orElse: () {
      //         return CustomLinearButton(
      //           width: MediaQuery.of(context).size.width,
      //           height: 50.w,
      //           onPressed: () {
      //             _validateThenDoLogin(context);
      //           },
      //           child: TextApp(
      //             text: context.translate(LangKeys.login),
      //             theme: context.textStyle.copyWith(
      //               fontSize: 18.sp,
      //               fontWeight: FontWeightHelper.bold,
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    final LoginController _ctlr = Get.find<LoginController>();

    if (_ctlr.formKey.currentState!.validate()) {
     Get.to(OtpScreen());
    } else {
      ShowToast.showToastErrorTop(message: "Enter valid number");
    }
    // if (context.read<AuthBloc>().formKey.currentState!.validate()) {
    //   context.pushNamed(AppRoutes.otp);
    // }
  }
}
