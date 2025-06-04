import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:store_app/config/extensions/context_extensions.dart';

import '../style/fonts/font_family_helper.dart';
import '../style/fonts/font_weight_helper.dart';

class TwitterDrawerTile extends StatelessWidget {
  final IconData iconPath;
  final String title;
  final VoidCallback onTap;
  final bool isSubTile;

  const TwitterDrawerTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
    this.isSubTile = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minLeadingWidth: isSubTile ? 28 : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      minVerticalPadding: 0,
      dense: true,
      leading: Icon(iconPath),
      // leading: SvgPicture.asset(iconPath,
      //     height: isSubTile ? 18 : null,
      //     width: isSubTile ? null :24,
      //
      //     colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn)),
      title: Text(
        title,
        style: isSubTile
            ? context.textStyle.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeightHelper.medium,
                color: Colors.black,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              )
            : context.textStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.bold,
                color: Colors.black,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
      ),
    );
  }
}
