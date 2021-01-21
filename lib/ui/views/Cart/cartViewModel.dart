import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/services/storageService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  StorageService _storageService =
      locator<StorageService>();

  List cartproducts = [];

  void addQuantity({index}) {
    cartproducts[index]["quantity"]++;
    notifyListeners();
  }

  void setCount() {
    cartproducts = _storageService.cartProducts;
    notifyListeners();
  }

  void removeQuantity({index}) {
    if (cartproducts[index]["quantity"] > 1) {
      cartproducts[index]["quantity"]--;
    }
    notifyListeners();
  }

  void goHome() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  void goToCheckOut(data) {
    _storageService.addNotification("notification");
    _navigationService.navigateTo(Routes.checkOutView, arguments: data);
  }

  void deleteCart(index) {
    _storageService.deleteCartProducts(index);
    notifyListeners();
  }
}
