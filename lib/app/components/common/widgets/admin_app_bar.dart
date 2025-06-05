import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:store_app/app/components/common/widgets/text_app.dart';
import 'package:store_app/config/extensions/context_extensions.dart';

import '../style/fonts/font_family_helper.dart';
import '../style/fonts/font_weight_helper.dart';


class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppBar({
    required this.isMain,
    required this.backgroundColor,
    required this.title,
    super.key,
  });

  final bool isMain;
  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: GestureDetector(
        onTap: (){
         // context.pushNamedAndRemoveUntil(AppRoutes.homeSuperAdmin);
        },
        child: TextApp(
          text: title,
          theme: context.textTheme.bodyLarge!.copyWith(
            fontSize: 18.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.bold,
            color: Colors.white,
          ),
        ),
      ),
      leading: isMain
          ? IconButton(
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
              icon: const Icon(Icons.menu, color: Colors.white),
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50.h);
}
