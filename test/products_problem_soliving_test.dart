import 'dart:io';
import 'package:products_problem_soliving/constant.dart';
import 'package:test/test.dart';

void main() {
  test('writes correct output', () async {
    // arrange
    final expectedAverageQuantitiesFileName = '0_product_table_expected.csv';
    final expectedMostPopularBrandsFileName = '1_product_table_expected.csv';

    final expectedAverageQuantitiesFile =
        File(Constants.directoryPath + expectedAverageQuantitiesFileName);
    final expectedMostPopularBrandsFile =
        File(Constants.directoryPath + expectedMostPopularBrandsFileName);
    final expectedAverageQuantitiesLines =
        await expectedAverageQuantitiesFile.readAsLines();
    final expectedMostPopularBrandsLines =
        await expectedMostPopularBrandsFile.readAsLines();

    final actualAverageQuantitiesFileName = '0_product_table_output.csv';
    final actualMostPopularBrandsFileName = '1_product_table_output.csv';

    // act
    final actualAverageQuantitiesFile =
        File(Constants.directoryPath + actualAverageQuantitiesFileName);
    final actualMostPopularBrandsFile =
        File(Constants.directoryPath + actualMostPopularBrandsFileName);
    final actualAverageQuantitiesLines =
        await actualAverageQuantitiesFile.readAsLines();
    final actualMostPopularBrandsLines =
        await actualMostPopularBrandsFile.readAsLines();

    // ass
    expect(actualAverageQuantitiesLines,
        hasLength(expectedAverageQuantitiesLines.length));
    for (var i = 0; i < actualAverageQuantitiesLines.length; i++) {
      expect(actualAverageQuantitiesLines[i],
          equals(expectedAverageQuantitiesLines[i]));
    }

    expect(actualMostPopularBrandsLines,
        hasLength(expectedMostPopularBrandsLines.length));
    for (var i = 0; i < actualMostPopularBrandsLines.length; i++) {
      expect(actualMostPopularBrandsLines[i],
          equals(expectedMostPopularBrandsLines[i]));
    }
  });
}
