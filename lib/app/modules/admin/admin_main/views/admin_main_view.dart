// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:store_app/app/modules/admin/Dashboard/views/dashboard_view.dart';
// import 'package:store_app/app/modules/admin/Sales_history/views/sales_history_view.dart';
// import 'package:store_app/app/modules/admin/admin_main/views/widgets/appbar_admin.dart';
// import 'package:store_app/app/modules/admin/admin_main/views/widgets/drawer_admin.dart';
// import 'package:store_app/app/modules/admin/inventory_tracking/views/inventory_tracking_view.dart';
// import 'package:store_app/app/modules/admin/product_management/views/product_management_view.dart';
//
// import '../../../../../utils/enum/nav_bar_enum.dart';
// import '../controllers/admin_main_controller.dart';
//
// class AdminMainView extends GetView<AdminMainController> {
//   const AdminMainView({super.key});
//   @override
//   Widget build(BuildContext context) {
//
//         return Scaffold(
//         // drawer: DrawerAdmin(),
//      // appBar: const MainAdminAppBar(), // Your updated AppBar will use GetX internally
//      body: Container(
//     constraints: const BoxConstraints.expand(),
//     child: Column(
//     children: [
//     Expanded(
//     child: Obx(
//     () {
//     // React to changes in the selectedNavItem observable
//     switch (controller.selectedNavItem.value) {
//     case NavBarEnum.home:
//     return const DashboardView();
//     case NavBarEnum.inventory:
//      return InventoryTrackingView(); // Your Favorites screen widget
//     case NavBarEnum.addNew:
//     return  ProductManagementView(); // Your Notifications screen widget
//     case NavBarEnum.sales:
//      return const SalesHistoryView(); // Your Profile screen widget
//       case NavBarEnum.settings:
//         return const SalesHistoryView(); //
//     default:
//     return const DashboardView(); // Default to Home screen
//     }
//     },
//     ),
//     ),
//    // MainBottomNavBar(), // This will need to be updated to use the MainController
//     ],
//     ),
//     ),
//     );
//   }
// }
//
//
//
//
//
//
