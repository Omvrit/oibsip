import 'package:farmpure/models/product.dart';

class Order {
  final String id;
  final List<Product> products;
  final DateTime date;
  final int quantity;

  Order({
    required this.id,
    required this.products,
    required this.date,
    this.quantity = 1,
  });
}
