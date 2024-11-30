import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmpure/data/products.dart';
import 'package:farmpure/models/product.dart';

// Update the `RetrieveProduct` class to return a list of products correctly
class RetrieveProduct {
  static Future<List<Product>> retrieveProduct() async {
    List<Product> products = [];
    try {
      await FirebaseFirestore.instance
          .collection('ProductItem')
          .get()
          .then((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          products.add(Product.fromMap(doc.data()));
          print(doc.data());
        }
        print(products.length);
      });
    } on Exception catch (e) {
      print(e);
    }
    return products;
  }
}