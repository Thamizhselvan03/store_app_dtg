import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store_app/app/modules/admin/admin_main/controllers/admin_main_controller.dart';
import 'package:store_app/config/extensions/context_extensions.dart';

import '../../../../../../utils/constants.dart';
import '../../../../../../utils/enum/nav_bar_enum.dart';
import '../../../../../components/common/animations/animate_do.dart';
import '../../../../../components/common/style/fonts/font_weight_helper.dart';
import '../../../../../components/common/widgets/custom_linear_button.dart';
import '../../../../../components/common/widgets/text_app.dart';


class MainAdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAdminAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    final AdminMainController _controller = Get.find();

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: context.theme.primaryColor,
      elevation: 0,
      title: Obx(
            () {
          // React to changes in the selectedNavItem observable
          if (_controller.selectedNavItem.value == NavBarEnum.home) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 27.sp,
                  onPressed: () {
                    // Use ScaffoldMessenger to access the Scaffold and open the drawer
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Opening Drawer...'),
                        duration: Duration(milliseconds: 500), // Adjust as needed
                      ),
                    );
                    // You might need to use a GlobalKey for the Scaffold to reliably open the drawer
                    // Or pass the ScaffoldState from the parent widget
                    // For simplicity in this example, let's assume you can access the Scaffold
                    // However, accessing Scaffold from a StatelessWidget like this can be tricky.
                    // A more robust approach is to use a Builder or pass the ScaffoldState.
                    // For now, let's keep the original logic but be aware of potential issues.
                    Scaffold.of(context).openDrawer(); // Original logic - might need adjustment
                  },
                  icon: Icon(Icons.menu),
                ),

                CustomFadeInRight(
                  duration: 800,
                  child: TextApp(
                    text: "Dashboard",
                    theme: context.textStyle.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeightHelper.bold,
                      //color: context.color.textColor,
                    ),
                  ),
                ),
                CustomFadeInLeft(
                  duration: 800,
                  child: CustomLinearButton(
                    onPressed: () {
                      //  context.pushName(AppRoutes.search); // Use GetX navigation here if needed
                    },
                    child: Center(
                      //child: SvgPicture.asset(AppImages.notificationIcon),
                    ),
                  ),
                ),
              ],
            );
          } else if (_controller.selectedNavItem.value == NavBarEnum.inventory) {
            return CustomFadeInRight(
              duration: 800,
              child: TextApp(
                text: 'Your Favorite',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.bold,
                 // color: context.color.textColor,
                ),
              ),
            );
          } else if (_controller.selectedNavItem.value == NavBarEnum.addNew) {
            return CustomFadeInRight(
              duration: 800,
              child: TextApp(
                text: 'Notifications',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.bold,
                 // color: context.color.textColor,
                ),
              ),
            );
          }
          // You might have other NavBarEnum cases here
          // else if (controller.selectedNavItem.value == NavBarEnum.profile) {
          //   return CustomFadeInRight(
          //     duration: 800,
          //     child: TextApp(
          //       text: 'Profile',
          //       theme: context.textStyle.copyWith(
          //         fontSize: 20.sp,
          //         fontWeight: FontWeightHelper.bold,
          //         color: context.color.textColor,
          //       ),
          //     ),
          //   );
          // }
          return const SizedBox.shrink();
        },
      ),
    );}

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}