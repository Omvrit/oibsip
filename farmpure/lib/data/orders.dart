import 'package:farmpure/data/products.dart';
import 'package:farmpure/models/order.dart';

List<Order> orders = [
  Order(
    id: "202304a5",
    products: products.toList(),
    quantity: 2,
    date: DateTime.utc(2023),
  ),
  Order(
    id: "202204jm",
    products: products.toList(),
    quantity: 3,
    date: DateTime.utc(2022),
  ),
  Order(
    id: "201904vc",
    products: products.toList(),
    quantity: 1,
    date: DateTime.utc(2019),
  ),
];
