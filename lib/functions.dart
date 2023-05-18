import 'dart:io';
import 'package:products_problem_soliving/order.dart';
import 'package:products_problem_soliving/constant.dart';

void writeAverageQuantities(
    Map<String, List<Order>> products, String inputFileName) {
  final outputFileName = '${Constants.directoryPath}0_$inputFileName';
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
    Map<String, List<Order>> products, String inputFileName) {
  final outputFileName = '${Constants.directoryPath}1_$inputFileName';
  final outputFile = File(outputFileName).openWrite();
  for (final productName in products.keys) {
    final orders = products[productName]!;
    final brandCounts = <String, int>{};
    //print("orders  : ${orders.toString()}");
    for (final order in orders) {
      final brand = order.brand;
      if (!brandCounts.containsKey(brand)) {
        brandCounts[brand] = 0;
        print("1>>>>>");
      }
      brandCounts[brand] =
          (brandCounts[brand] ?? 0) + int.parse(order.quantity as String);
      print("${brandCounts}>>>>>");
    }

    final mostPopularBrand = brandCounts.entries
        .fold(brandCounts.entries.first, (a, b) => a.value > b.value ? a : b);
    print("entries ${brandCounts.entries}>>>>>");
    outputFile.write('$productName,${mostPopularBrand.key}\n');
  }
  outputFile.close();
  print('Wrote $outputFileName');
}
