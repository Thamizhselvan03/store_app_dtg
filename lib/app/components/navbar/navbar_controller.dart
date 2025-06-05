import 'package:get/get.dart';
import 'package:store_app/app/modules/customer/customers_home/views/customers_home_view.dart';

import '../../modules/customer/Cust_Grocery_list/views/cust_grocery_list_view.dart';
import '../../modules/customer/qr_scanner/views/qr_scanner_view.dart';
import '../../modules/example/home-with-graphql/views/graphql_view.dart';

class NavbarController extends GetxController {
  List navigation = [
    const CustomersHomeView(),
    const CustGroceryListView(),
    const QrScannerView(),
    const GraphQLView(),
  ];
  RxInt selectedIndex = 0.obs;

  void onTap(int index) {
    selectedIndex.value = index;
  }
}
