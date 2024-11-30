import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class AddProduct {
  static Future<bool> addProduct({
    required String name,
    required String description,
    required File image,
    required double price,
    required String category,
    required int stock,
    required int sold,
    required String userUid,
  }) async {
    try {
      print("Ok we are here");
      print(image.path);
      print(name);
      print(description);
      print(price);
      print(category);
      print(stock);
      print(sold);
      print(userUid);

      // Create a reference to the Firebase Storage location
      // String downloadUrl = '';
      // final url =
      //     Uri.parse('https://api.cloundinary.com/v1_1/dbq1ulh8r/upload');
      // print(url);
      // print("okk we are here");
      // final request = http.MultipartRequest('POST', url)
      //   ..fields['upload_preset'] = 'ofnxhc7u'
      //   ..files.add(await http.MultipartFile.fromPath('file', image.path));
      //
      // final response = await request.send();
      //
      // if (response.statusCode == 200) {
      //   final responseData = await response.stream.toBytes();
      //   print(responseData);
      //   final responseString = String.fromCharCodes(responseData);
      //   print(responseString);
      //
      //   final  responseJson =jsonDecode(responseString);
      //   downloadUrl = responseJson['secure_url'];
      //
      //   print("downloadUrl"+downloadUrl);
      // } else {
      //   print('error');
      // }

      await FirebaseFirestore.instance.collection('ProductItem').add({
        'name': name,
        'description': description,
        'image': "",
        'price': price,
        'category': category,
        'stock': stock,
        'sold': sold,
        'userUid': userUid,
        'rating': 0,
      });
      return true;
    } on SocketException {
      throw 'No internet connection';
      return false;
    } catch (e) {
      throw 'An error occurred';
    }
  }
}
