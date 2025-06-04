import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/app/components/common/style/colors/colors_light.dart';

import '../../../../../../config/theme/light_theme_colors.dart';

class SecondaryTabbar extends StatefulWidget {
  final double radius;

  const SecondaryTabbar({super.key, this.radius = 0});

  @override
  _SecondaryTabbarState createState() => _SecondaryTabbarState();
}

class _SecondaryTabbarState extends State<SecondaryTabbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFF292929),
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Container(
                  color: _selectedIndex == 0
                      ? context.iconColor
                      : Colors.white,
                  child: Center(
                    child: Text(
                      'Ongoing',
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: _selectedIndex == 0 ? Colors.white : context.theme.hintColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Container(
                  color: _selectedIndex == 1 ? context.iconColor : Colors.white,
                  child: Center(
                    child: Text(
                      'Completed',
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: _selectedIndex == 1 ? Colors.white : context.theme.hintColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
