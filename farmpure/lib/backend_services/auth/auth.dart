import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } catch (e) {
      print('Login error: $e');
      rethrow;
    }
  }

  static Future<UserCredential> register(String email, String password, String username) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.updateDisplayName(username);

      await _firebaseFirestore.collection("users").doc(userCredential.user?.uid).set({
        "id": userCredential.user?.uid,
        "email": email,
        "username": username,
        "cart": {
          "products": [],
          "total": 0.0,
        },
        "my_services": [],
        "wishlist": [],
        "orders": [],
        "address": [],
      });
      return userCredential;
    } catch (e) {
      print('Registration error: $e');
      rethrow;
    }
  }
}