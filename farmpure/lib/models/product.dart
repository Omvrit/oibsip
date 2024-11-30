import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  int available;
  String category;
  DateTime createdAt;
  String id;
  String image;
  String name;
  String description = "This is a description";
  double price;
  int quantity;
  double rating;
  int sold;
  int unit = 1;
  String userUid;

  // Constructor
  Product({
    required this.available,
    required this.category,
    required this.createdAt,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.sold,
    required this.userUid,
  });

  // Factory method to create a Product from a map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      available: map['available'] ?? 0,
      category: map['category'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      price: (map['price'])*1.0 ?? 0.0,
      quantity: map['quantity'] ?? 0,
      rating: map['rating']*1.0 ?? 0.0,
      sold: map['sold'] ?? 0,
      userUid: map['userUid'] ?? '',
    );
  }

  // Method to convert a Product to a map
  Map<String, dynamic> toMap() {
    return {
      'available': available,
      'category': category,
      'createdAt': createdAt, // If sending to Firestore, keep this as DateTime
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'quantity': quantity,
      'rating': rating,
      'sold': sold,
      'userUid': userUid,
    };
  }
}
