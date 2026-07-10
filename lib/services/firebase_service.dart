import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/models.dart';


















class FirebaseService {
  FirebaseService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  User? get currentUser => _auth.currentUser;

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore
        .collection('users')
        .doc(credential.user!.uid)
        .set({
      'uid': credential.user!.uid,
      'name': name,
      'email': email,
      'profileImage': '',
      'createdAt': FieldValue.serverTimestamp(),
    });

    return credential;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<UserModel?> getUserProfile() async {
    if (currentUser == null) return null;

    final document = await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .get();

    if (!document.exists) return null;

    return UserModel.fromJson(document.data()!);
  }

  Future<void> updateWishlist(
    List<String> wishlist,
  ) async {
    if (currentUser == null) return;

    await _firestore
        .collection('users')
        .doc(currentUser!.uid)
        .update({
      'wishlist': wishlist,
    });
  }

  Future<String> uploadProfileImage(
    File image,
  ) async {
    if (currentUser == null) {
      throw Exception('User not logged in');
    }

    final reference = _storage
        .ref()
        .child('profiles')
        .child('${currentUser!.uid}.jpg');

    await reference.putFile(image);

    return await reference.getDownloadURL();
  }
}