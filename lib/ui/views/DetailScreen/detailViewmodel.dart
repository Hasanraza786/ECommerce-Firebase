import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/services/FireStoreService.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  FirebaseFirestoreService _firestoreService =
      locator<FirebaseFirestoreService>();
  List<String> size = ["S", "M", "L", "XXL"];

  List<Color> colors = [
    Colors.blue[200],
    Colors.green[200],
    Colors.yellow[200],
    Colors.cyan[300]
  ];

  int count = 1;

  void addQuantity() {
    count++;
    notifyListeners();
  }

  void removeQuantity() {
    if (count > 1) {
      count--;
    }
    notifyListeners();
  }

  void backToHome() {
    _navigationService.popRepeated(1);
  }

  void goToCartView(data) {}

  List products = [];
  Future addCart(Map product) async {
    await _firestoreService.addCartProducts(product);
    products = _firestoreService.cartProducts;
    if (products != null) {
      print([products, "proooo"]);

      _navigationService.navigateTo(Routes.cartView);
    }
  }
}
