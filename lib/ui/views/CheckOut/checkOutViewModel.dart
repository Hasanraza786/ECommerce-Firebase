import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/services/storageService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckOutViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  StorageService _storageService = locator<StorageService>();

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
}
