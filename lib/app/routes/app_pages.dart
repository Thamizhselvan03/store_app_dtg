import 'package:get/get.dart';

import '../components/navbar/fixed_bottom_navbar.dart';
import '../components/navbar/floating_bottom_navbar.dart';
import '../components/navbar/navbar_binding.dart';
import '../modules/admin/Dashboard/bindings/dashboard_binding.dart';
import '../modules/admin/Dashboard/views/dashboard_view.dart';
import '../modules/admin/Reports/bindings/reports_binding.dart';
import '../modules/admin/Reports/views/reports_view.dart';
import '../modules/admin/Sales_history/bindings/sales_history_binding.dart';
import '../modules/admin/Sales_history/views/sales_history_view.dart';
import '../modules/admin/admin_main/bindings/admin_main_binding.dart';
import '../modules/admin/admin_main/views/admin_main_view.dart';
import '../modules/admin/inventory_tracking/bindings/inventory_tracking_binding.dart';
import '../modules/admin/inventory_tracking/views/inventory_tracking_view.dart';
import '../modules/admin/product_management/bindings/product_management_binding.dart';
import '../modules/admin/product_management/views/product_management_view.dart';
import '../modules/customer/Cust_Grocery_list/bindings/cust_grocery_list_binding.dart';
import '../modules/customer/Cust_Grocery_list/views/cust_grocery_list_view.dart';
import '../modules/customer/Cust_Grocery_list_items/bindings/cust_grocery_list_items_binding.dart';
import '../modules/customer/Cust_Grocery_list_items/views/cust_grocery_list_items_view.dart';
import '../modules/customer/customer_home/bindings/customer_home_binding.dart';
import '../modules/customer/customer_home/views/customer_home_view.dart';
import '../modules/customer/customer_products_list/bindings/customer_products_list_binding.dart';
import '../modules/customer/customer_products_list/views/customer_products_list_view.dart';
import '../modules/customer/customers_home/bindings/customers_home_binding.dart';
import '../modules/customer/customers_home/views/customers_home_view.dart';
import '../modules/customer/login/bindings/login_binding.dart';
import '../modules/customer/login/views/login_view.dart';
import '../modules/customer/qr_scanner/bindings/qr_scanner_binding.dart';
import '../modules/customer/qr_scanner/views/qr_scanner_view.dart';
import '../modules/example/home-with-graphql/bindings/graphql_binding.dart';
import '../modules/example/home-with-graphql/views/graphql_view.dart';
import '../modules/example/home-with-restAPI/bindings/home_binding.dart';
import '../modules/example/home-with-restAPI/views/home_view.dart';
import '../modules/example/home-with-restAPI/views/post_detail_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const ONBOARDING = Routes.ONBOARDING;
  static const FIXED_NAV = Routes.FIXED_NAV;
  static const FLOATING_NAV = Routes.FLOATING_NAV;
  static const HOME = Routes.HOME;
  static const POST_DETAIL = Routes.POST_DETAIL;
  static const Login = Routes.LOGIN;
  static const CUSTOMER_HOME = Routes.CUSTOMER_HOME;
  static const CUSTOMER_PRODUCTS_LIST = Routes.CUSTOMER_PRODUCTS_LIST;
  static const INVENTORY_TRACKING = Routes.INVENTORY_TRACKING;
  static const PRODUCT_MANAGEMENT = Routes.PRODUCT_MANAGEMENT;
  static const DASHBOARD = Routes.DASHBOARD;
  static const SALES_HISTORY = Routes.SALES_HISTORY;
  static const REPORTS = Routes.REPORTS;
  static const ADMIN_MAIN = Routes.ADMIN_MAIN;
  static const CUST_GROCERY_LIST = Routes.CUST_GROCERY_LIST;
  static const CUST_GROCERY_LIST_ITEMS = Routes.CUST_GROCERY_LIST_ITEMS;
  static const QR_SCANNER = Routes.QR_SCANNER;

  static final routes = [
    /// NAV BARs
    GetPage(
      name: _Paths.FIXED_NAV,
      page: () => const FixedBottomNavbar(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.FLOATING_NAV,
      page: () => const FloatingBottomNavbar(),
      binding: NavbarBinding(),
    ),

    ///
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.POST_DETAIL,
      page: () => const PostDetailView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GRAPHQL,
      page: () => const GraphQLView(),
      binding: GraphQLBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_HOME,
      page: () => const CustomerHomeView(),
      binding: CustomerHomeBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_PRODUCTS_LIST,
      page: () => const CustomerProductsListView(),
      binding: CustomerProductsListBinding(),
    ),
    GetPage(
      name: _Paths.INVENTORY_TRACKING,
      page: () => InventoryTrackingView(),
      binding: InventoryTrackingBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_MANAGEMENT,
      page: () => const ProductManagementView(),
      binding: ProductManagementBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SALES_HISTORY,
      page: () => const SalesHistoryView(),
      binding: SalesHistoryBinding(),
    ),
    GetPage(
      name: _Paths.REPORTS,
      page: () => const ReportsView(),
      binding: ReportsBinding(),
    ),
    // GetPage(
    //   name: _Paths.ADMIN_MAIN,
    //   page: () => const AdminMainView(),
    //   binding: AdminMainBinding(),
    // ),
    GetPage(
      name: _Paths.CUSTOMERS_HOME,
      page: () => const CustomersHomeView(),
      binding: CustomersHomeBinding(),
    ),
    GetPage(
      name: _Paths.CUST_GROCERY_LIST,
      page: () => const CustGroceryListView(),
      binding: CustGroceryListBinding(),
    ),
    GetPage(
      name: _Paths.CUST_GROCERY_LIST_ITEMS,
      page: () => const CustGroceryListItemsView(),
      binding: CustGroceryListItemsBinding(),
    ),
    GetPage(
      name: _Paths.QR_SCANNER,
      page: () => const QrScannerView(),
      binding: QrScannerBinding(),
    ),
  ];
}
