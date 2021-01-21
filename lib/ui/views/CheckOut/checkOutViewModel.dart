import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/models/userModel.dart';
import 'package:eCommerce/services/AuthService.dart';
import 'package:eCommerce/services/storageService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

class CheckOutViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();
  StorageService _storageService = locator<StorageService>();
  UserModel get userModel => _authService.currentUser;
  User get user => FirebaseAuth.instance.currentUser;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void goHome() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  List checkoutproducts = [];

  void setCheckOut() async {
    checkoutproducts = _storageService.cartProducts;

    notifyListeners();
  }

  void deleteProduct(index) {
    _storageService.deleteCartProducts(index);
    notifyListeners();
  }

  Future clearProduct() async {
    _storageService.clearCartProducts();
    notifyListeners();
  }

  Future addOrder({totalPrice, List products}) async {
    await _storageService.addOrder(
        user: user,
        uid: user.uid,
        userAdress: userModel.adress,
        userEmail: userModel.email,
        userName: userModel.name,
        userNumber: userModel.phoneNumber,
        totalPrice: totalPrice,
        products: products);

    await clearProduct();

    notifyListeners();
  }

  void showSnackBar() {
    scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text("No Item Yet")));
  }
}
