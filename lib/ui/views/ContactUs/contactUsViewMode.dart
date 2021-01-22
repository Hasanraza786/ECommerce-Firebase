import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/models/userModel.dart';
import 'package:eCommerce/services/AuthService.dart';
import 'package:eCommerce/services/storageService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ContactUsViewModel extends BaseViewModel {
  final StorageService _storageService = locator<StorageService>();
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final TextEditingController messageController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  UserModel get userModel => _authService.currentUser;
  User get user => FirebaseAuth.instance.currentUser;

  void validation() {
    if (messageController.text.isEmpty) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Field is Empty")));
    } else {
      addingMessage();
    }
    notifyListeners();
  }

  Future addingMessage() async {
    await _storageService.addMessage(
        user: user,
        email: userModel.email,
        name: userModel.name,
        message: messageController.text);
    notifyListeners();
  }

  void goBack() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    notifyListeners();
  }
}
