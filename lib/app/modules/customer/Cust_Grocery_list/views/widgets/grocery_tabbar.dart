import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../config/theme/light_theme_colors.dart';
import '../../../Cust_Grocery_list/controllers/cust_grocery_list_controller.dart';

class SecondaryTabbar extends StatelessWidget {
  const SecondaryTabbar({Key? key, this.radius = 10}) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    final _ctrl = Get.find<CustGroceryListController>();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFF292929),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _ctrl.selectedIndex.value = 0,
              child: Obx(() {
                final isSelected = _ctrl.selectedIndex.value == 0;
                return Container(
                  color: isSelected ? context.iconColor : Colors.white,
                  alignment: Alignment.center,
                  child: Text(
                    'Ongoing',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : context.theme.hintColor,
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _ctrl.selectedIndex.value = 1,
              child: Obx(() {
                final isSelected = _ctrl.selectedIndex.value == 1;
                return Container(
                  color: isSelected ? context.iconColor : Colors.white,
                  alignment: Alignment.center,
                  child: Text(
                    'Completed',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : context.theme.hintColor,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}