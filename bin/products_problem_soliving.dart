import 'dart:io';

import 'package:products_problem_soliving/constant.dart';
import 'package:products_problem_soliving/functions.dart';
import 'package:products_problem_soliving/order.dart';

void main() {
  final inputFileName = 'product_table.csv';
  final inputFile = File(Constants.directoryPath + inputFileName);
  final lines = inputFile.readAsLinesSync();

  final products = <String, List<Order>>{};
  for (final line in lines.skip(1)) {
    final values = line.split(',');

    final order = Order(
      id: int.parse(values[0].trim()),
      area: values[1].trim(),
      productName: values[2].trim(),
      quantity: int.parse(values[3].trim()),
      brand: values[4].trim(),
    );
    if (!products.containsKey(order.productName)) {
      products[order.productName] = [];
    }
    products[order.productName]!.add(order);
  }

  writeAverageQuantities(products, inputFileName);
  writeMostPopularBrands(products, inputFileName);
}
