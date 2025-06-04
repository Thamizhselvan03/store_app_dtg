import 'package:get/get.dart';

class SalesHistoryController extends GetxController {
  //TODO: Implement SalesHistoryController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // Fetch initial sales history when the controller is initialized
    fetchSalesHistory();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final salesHistory = <Sale>[].obs;
  final filteredSalesHistory = <Sale>[].obs;

  // Observable for the current search query
  final searchQuery = ''.obs;



  // Method to fetch sales history data
  void fetchSalesHistory() {
    // TODO: Replace with actual data fetching from a database or API
    // For now, using dummy data
    final dummyData = [
      Sale(
        id: 'SALE001',
        date: DateTime.now().subtract(Duration(days: 1)),
        totalAmount: 150.00,
        items: [
          SaleItem(productName: 'Product A', quantity: 2, price: 50.00),
          SaleItem(productName: 'Product B', quantity: 1, price: 50.00),
        ],
      ),
      Sale(
        id: 'SALE002',
        date: DateTime.now().subtract(Duration(days: 2)),
        totalAmount: 220.50,
        items: [
          SaleItem(productName: 'Product C', quantity: 3, price: 30.00),
          SaleItem(productName: 'Product D', quantity: 1, price: 130.50),
        ],
      ),
      Sale(
        id: 'SALE003',
        date: DateTime.now().subtract(Duration(days: 3)),
        totalAmount: 80.00,
        items: [
          SaleItem(productName: 'Product A', quantity: 1, price: 50.00),
          SaleItem(productName: 'Product E', quantity: 1, price: 30.00),
        ],
      ),
    ];

    salesHistory.assignAll(dummyData);
    filteredSalesHistory.assignAll(dummyData); // Initially filtered list is the same as the full list
  }

  // Method to filter sales history based on search query
  void filterSalesHistory(String query) {
    searchQuery.value = query.toLowerCase();
    if (searchQuery.isEmpty) {
      filteredSalesHistory.assignAll(salesHistory);
    } else {
      filteredSalesHistory.assignAll(salesHistory.where((sale) {
        // Filter by sale ID, product name, or any other relevant field
        return sale.id.toLowerCase().contains(searchQuery.value) ||
            sale.items.any((item) => item.productName.toLowerCase().contains(searchQuery.value));
      }).toList());
    }
  }

  // Method to get a single sale detail by ID (if needed)
  Sale? getSaleById(String id) {
    return salesHistory.firstWhereOrNull((sale) => sale.id == id);
  }

  // You might also want methods for sorting the sales history (e.g., by date)
  void sortByDate() {
    filteredSalesHistory.sort((a, b) => b.date.compareTo(a.date)); // Sort in descending order
  }
}

// Dummy Sale and SaleItem models (replace with your actual models)
class Sale {
  final String id;
  final DateTime date;
  final double totalAmount;
  final List<SaleItem> items;

  Sale({
    required this.id,
    required this.date,
    required this.totalAmount,
    required this.items,
  });
}

class SaleItem {
  final String productName;
  final int quantity;
  final double price;

  SaleItem({
    required this.productName,
    required this.quantity,
    required this.price,
  });
}