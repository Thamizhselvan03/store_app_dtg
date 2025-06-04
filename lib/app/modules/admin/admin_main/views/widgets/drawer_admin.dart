import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/app/modules/admin/admin_main/controllers/admin_main_controller.dart';
import 'package:store_app/app/routes/app_pages.dart';

import '../../../../../../utils/enum/nav_bar_enum.dart';
import '../../../../../components/common/drawer/drawer_header.dart';
import '../../../../../components/common/drawer/drawer_tile.dart';

class DrawerAdmin extends StatelessWidget {
  DrawerAdmin({super.key});

  final AdminMainController _ctrl = Get.put(AdminMainController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      //backgroundColor: const Color(0xFFF5FCF9),
      width: MediaQuery.sizeOf(context).width - 73,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              const TwitterDrawerHeader(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Divider(thickness: 0.1),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      TwitterDrawerTile(
                        iconPath: Icons.dashboard,
                        title: 'Dashboard',
                        onTap: () {
                          if (Get.currentRoute != AppPages.DASHBOARD) {
                            Get.offNamed(
                              AppPages.DASHBOARD,
                            ); // Use offNamed to avoid stacking routes
                          } else {
                            Navigator.pop(
                              context,
                            ); // Or you can use Get.back() for consistency
                          }

                          // Get.toNamed(AppPages.DASHBOARD);
                          //    Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 10),
                      TwitterDrawerTile(
                        iconPath: Icons.inventory,
                        title: 'Inventory Management',
                        onTap: () {
                          // _ctrl.changePage(NavBarEnum.inventory);

                          if (Get.currentRoute != AppPages.INVENTORY_TRACKING) {
                            Get.offNamed(
                              AppPages.INVENTORY_TRACKING,
                            ); // Use offNamed to avoid stacking routes
                          } else {
                            Navigator.pop(
                              context,
                            ); // Or you can use Get.back() for consistency
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TwitterDrawerTile(
                        iconPath: Icons.add_box,
                        title: 'Add New Product',
                        onTap: () {
                          if (Get.currentRoute != AppPages.PRODUCT_MANAGEMENT) {
                            Get.offNamed(
                              AppPages.PRODUCT_MANAGEMENT,
                            ); // Use offNamed to avoid stacking routes
                          } else {
                            Navigator.pop(
                              context,
                            ); // Or you can use Get.back() for consistency
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TwitterDrawerTile(
                        iconPath: Icons.history,
                        title: 'Sales History',
                        onTap: () {
                          if (Get.currentRoute != AppPages.SALES_HISTORY) {
                            Get.offNamed(
                              AppPages.SALES_HISTORY,
                            ); // Use offNamed to avoid stacking routes
                          } else {
                            Navigator.pop(
                              context,
                            ); // Or you can use Get.back() for consistency
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TwitterDrawerTile(
                        iconPath: Icons.analytics,
                        title: 'Reports',
                        onTap: () {
                          Get.toNamed(AppPages.REPORTS);
                        },
                      ),
                      const SizedBox(height: 10),
                      TwitterDrawerTile(
                        iconPath: Icons.settings,
                        title: 'Settings',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 10),
                      TwitterDrawerTile(
                        iconPath: Icons.logout,
                        title: 'Logout',
                        onTap: () {},
                      ),
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Divider(thickness: 0.1),
                      ),
                      const SizedBox(height: 10),
                      /*      TwitterDrawerExpansionTile(
                          title: 'Settings & Support',
                          children: [
                            TwitterDrawerTile(
                              iconPath: Icons.logout,
                              title: 'Settings & Privacy',
                              onTap: () {},
                              isSubTile: true,
                            ),
                            TwitterDrawerTile(
                              iconPath:Icons.logout,
                              title: 'Help Center',
                              onTap: () {},
                              isSubTile: true,
                            )
                          ])*/
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Container(
          //   height: 45,
          //   alignment: Alignment.centerLeft,
          //   padding: const EdgeInsets.only(left: 16),
          //   width: double.infinity,
          //   // color: const .withAlpha(10),
          //   child: const Icon(Icons.brightness_2, color: Colors.black),
          // )
        ],
      ),
    );
  }
}
