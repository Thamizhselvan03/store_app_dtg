import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/app/routes/app_pages.dart';
import 'package:store_app/config/extensions/context_extensions.dart';

import '../../../../../../components/common/animations/animate_do.dart';
import '../../../../../../components/common/style/fonts/font_weight_helper.dart';
import '../../../../../../components/common/widgets/custom_linear_button.dart';
import '../../../../../../components/common/widgets/text_app.dart';

class OtpButton extends StatelessWidget {
  const OtpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: CustomLinearButton(
        width: MediaQuery.of(context).size.width,
        height: 50.w,
        onPressed: () {
          // context.pushReplacementNamed(AppPages.FLOATING_NAV);
           context.pushReplacementNamed(AppPages.DASHBOARD);
        },
        child: TextApp(
          text: 'Next',
          theme: context.textTheme.bodyMedium!.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
      ),
    );
  }

  void _validateThenDoSignUp(BuildContext context) {
    // final authBloc = context.read<AuthBloc>();
    // final imageCubit = context.read<UploadImageCubit>();

    //if (!authBloc.formKey.currentState!.validate() ||
    //     imageCubit.getImageUrl.isEmpty) {
    //   if (imageCubit.getImageUrl.isEmpty) {
    //     ShowToast.showToastErrorTop(
    //       message: context.translate(LangKeys.validPickImage),
    //     );
    //   }
    //   debugPrint("[USER Tokenee] ====> ");
    // } else {
    // debugPrint("[USER Tok] ====> ${imageCubit.getImageUrl} ");
    // context.read<AuthBloc>().add(
    //  AuthEvent.signUp(imageUrl: imageCubit.getImageUrl),
    //);
    // }
  }
}
