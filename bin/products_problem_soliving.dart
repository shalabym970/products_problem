import 'dart:io';
import 'package:products_problem_soliving/order.dart';
import 'package:products_problem_soliving/constant.dart';
import 'package:products_problem_soliving/products_problem_soliving.dart';

void main() {
  final inputFileName = 'product_table.csv';
  final inputFile = File(Constants.directoryPath + inputFileName);
  final lines = inputFile.readAsLinesSync();

  final products = <String, List<Order>>{};
  for (final line in lines.skip(1)) {
    final values = line.split(',');
    final order = Order(
      id: int.parse(values[0]),
      area: values[1],
      productName: values[2],
      quantity: int.parse(values[3]),
      brand: values[4],
    );
    if (!products.containsKey(order.productName)) {
      products[order.productName] = [];
    }
    products[order.productName]!.add(order);
  }

  writeAverageQuantities(products, inputFileName);
  writeMostPopularBrands(products, inputFileName);
}

