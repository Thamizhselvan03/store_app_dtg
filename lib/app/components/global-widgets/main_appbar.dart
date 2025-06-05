import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.prefixAction,
    required this.title,
    this.suffix,
  });

  final VoidCallback? prefixAction;

  final String title;
  final List<Widget>? suffix;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: prefixAction == null
          ? null
          : IconButton(
              onPressed: prefixAction,
              icon: Icon(
                Get.isDarkMode ? Iconsax.backward : CupertinoIcons.back,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
      actions: suffix,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
