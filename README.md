# A first-level heading
Products Problem Solving
This is a Dart program that reads data from a CSV file and writes two output files:
A file (0_product_table_output.csv) that contains the average quantity of each product ordered.
A file (1_product_table_output.csv) that contains the most popular brand for each product ordered.

Prerequisites
To run this program, you need to have the Dart SDK installed on your system. You can download the latest version of the Dart SDK from the Dart website.

Usage
To run the program, follow these steps:
Open a terminal or command prompt and navigate to the directory containing the products_problem_solving.dart file.
Run the command dart products_problem_solving.dart. This will read the input data from the product_table.csv file and write the output data to two files: 0_product_table_output.csv and 1_product_table_output.csv.

Input Format
The input data should be in CSV format, with the following columns:
ID
Area
Product Name
Quantity
Brand
Each row represents a single order. The program will group orders by product name and calculate the average quantity and most popular brand for each product.

Output Format
The program will write two output files, one for the average quantities and one for the most popular brands. Each output file will contain one line for each product in the input data, with the following format:
Average Quantities: Product Name,Average Quantity
Most Popular Brands: Product Name,Most Popular Brand.

Testing
To run the unit tests for this program, you need to have the test package installed. You can install the test package by running the command pub get or flutter pub get if you're using Flutter.
Once you have the test package installed, you can run the tests by following these steps:
Open a terminal or command prompt and navigate to the root directory of your Dart project.
Run the command dart test/products_problem_solving_test.dart to run the tests in the specified file.

Acknowledgments
This program was created by [Mohamed Shalaby].
