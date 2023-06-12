import 'dart:io';
import 'constant.dart';
import 'order.dart';


void writeAverageQuantities(
    Map<String, List<Order>> products) {
  final outputFileName = '${Constants.directoryPath}0_product_table_output.csv';
  final outputFile = File(outputFileName).openWrite();
  for (final productName in products.keys) {
    final orders = products[productName]!;
    final totalQuantity = orders.fold(0, (sum, order) => sum + order.quantity);
    final averageQuantity = totalQuantity / orders.length;

    outputFile.write('$productName,$averageQuantity\n');
  }
  outputFile.close();
  print('Wrote $outputFileName');
}

void writeMostPopularBrands(
    Map<String, List<Order>> products) {
  final outputFileName = '${Constants.directoryPath}1_product_table_output.csv';
  final outputFile = File(outputFileName).openWrite();
  for (final productName in products.keys) {
    final orders = products[productName]!;
    final brandCounts = <String, int>{};
    for (final order in orders) {
      final brand = order.brand;
      if (!brandCounts.containsKey(brand)) {
        brandCounts[brand] = 0;
      }
      brandCounts[brand] = (brandCounts[brand] ?? 0) + 1;
    }

    final mostPopularBrand = brandCounts.entries
        .fold(brandCounts.entries.first, (a, b) => a.value > b.value ? a : b);
    print("entries ${brandCounts.entries}>>>>>");
    outputFile.write('$productName,${mostPopularBrand.key}\n');
  }
  outputFile.close();
  print('Wrote $outputFileName');
}
