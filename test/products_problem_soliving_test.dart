import 'package:products_problem_soliving/constant.dart';

import 'dart:io';
import 'package:test/test.dart';

void main() {
  // Define test group
  group('main', () {
    test('writes correct output', () async {
      // Set up input file and expected output files
      final inputFileName = 'product_table.csv';
      final expectedAverageQuantitiesFileName = '0_product_table_expected.csv';
      final expectedMostPopularBrandsFileName = '1_product_table_expected.csv';

      // Read input file and expected output files
      final inputFile = File(Constants.directoryPath + inputFileName);
      final expectedAverageQuantitiesFile =
          File(Constants.directoryPath + expectedAverageQuantitiesFileName);
      final expectedMostPopularBrandsFile =
          File(Constants.directoryPath + expectedMostPopularBrandsFileName);
      final expectedAverageQuantitiesLines =
          await expectedAverageQuantitiesFile.readAsLines();
      final expectedMostPopularBrandsLines =
          await expectedMostPopularBrandsFile.readAsLines();

      // Set up output file names
      final actualAverageQuantitiesFileName = '0_product_table_test.csv';
      final actualMostPopularBrandsFileName = '1_product_table_test.csv';

      // Run the main function
      main();

      // Read actual output files
      final actualAverageQuantitiesFile =
          File(Constants.directoryPath + actualAverageQuantitiesFileName);
      final actualMostPopularBrandsFile =
          File(Constants.directoryPath + actualMostPopularBrandsFileName);
      final actualAverageQuantitiesLines =
          await actualAverageQuantitiesFile.readAsLines();
      final actualMostPopularBrandsLines =
          await actualMostPopularBrandsFile.readAsLines();

      // Compare actual and expected output for average quantities
      expect(actualAverageQuantitiesLines,
          hasLength(expectedAverageQuantitiesLines.length));
      for (var i = 0; i < actualAverageQuantitiesLines.length; i++) {
        expect(actualAverageQuantitiesLines[i],
            equals(expectedAverageQuantitiesLines[i]));
      }

      // Compare actual and expected output for most popular brands
      expect(actualMostPopularBrandsLines,
          hasLength(expectedMostPopularBrandsLines.length));
      for (var i = 0; i < actualMostPopularBrandsLines.length; i++) {
        expect(actualMostPopularBrandsLines[i],
            equals(expectedMostPopularBrandsLines[i]));
      }
    });
  });
}
