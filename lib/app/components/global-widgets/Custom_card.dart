import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/config/extensions/context_extensions.dart';

import '../common/widgets/text_app.dart';

//
// class CustomCardModel {
//   final String image;
//   final String title;
//   final String desc;
//   final IconData trailing;
//
//   CustomCardModel(this.image, this.title, this.desc, this.trailing);
// }

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.img,
    required this.title,
    required this.desc,
     this.icon,
    this.onTap,
    this.iconTap,
  });

  final String img;
  final String title;
  final String desc;
  final IconData? icon;
  final Function()? onTap;
  final Function()? iconTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key,
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
        leading: CachedNetworkImage(height: 50, width: 50.w, imageUrl: img),
        title: TextApp(
          text: title,
          theme: context.textTheme.bodyLarge!.copyWith(
            color: Colors.black,

            fontSize: 14.sp,
          ),
        ),
        subtitle: TextApp(
          text: desc,
          theme: context.textTheme.bodyLarge!.copyWith(
            color: context.theme.hintColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: IconButton(
          onPressed: iconTap,
          icon:  Icon(icon??Icons.more_vert),
          color: context.theme.hintColor,
        ),
        tileColor: Colors.white,
        iconColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
