import 'dart:io';
import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/models/userModel.dart';
import 'package:eCommerce/services/storageService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  StorageService _storageService = locator<StorageService>();

  UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  String _imageUrl;

  String get imageUrl => _imageUrl;

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required name,
    @required gender,
    @required phoneNumber,
    @required image,
  }) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      _currentUser = UserModel(
          id: authResult.user.uid,
          email: email,
          name: name,
          gender: gender,
          phoneNumber: phoneNumber,
          image: image);

      await _storageService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

  Future isUserLoggedIn() async {
    User user = _auth.currentUser;
    if (user != null) {
      await _populateCurrentUser(user);
    }
    print([user != null]);
    return user != null;
  }

  Future _populateCurrentUser(User user) async {
    try {
      if (user != null) {
        _currentUser = await _storageService.getUser(user.uid);
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future logOut() async {
    await _auth.signOut();
  }

  Future uploadImage({File image}) async {
    User user = _auth.currentUser;
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("UserImage/${user.uid}");
    firebase_storage.UploadTask uploadTask = storageReference.putFile(image);
    _imageUrl = await (await uploadTask).ref.getDownloadURL();
  }
}
