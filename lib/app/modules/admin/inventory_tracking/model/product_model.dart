class Product {
  final String name;
  final String productId; // e.g., Barcode or SKU
  final String manufacturer;
  final String batchNumber;
  final DateTime expiryDate;
  final double purchasePrice;
  final double sellingPrice;
  int quantityInStock;
  final int reorderLevel;

  Product({
    required this.name,
    required this.productId,
    required this.manufacturer,
    required this.batchNumber,
    required this.expiryDate,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.quantityInStock,
    required this.reorderLevel,
  });
}
