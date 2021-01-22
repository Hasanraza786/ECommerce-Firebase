import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/services/storageService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  StorageService _storageService = locator<StorageService>();
  List<bool> isSelected = [true, false, false, false];
  List<bool> colored = [true, false, false, false];

  void setIndex(index, list) {
    for (int indexBtn = 0; indexBtn < list.length; indexBtn++) {
      if (indexBtn == index) {
        list[indexBtn] = true;
      } else {
        list[indexBtn] = false;
      }
      notifyListeners();
    }
    notifyListeners();
  }

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
    await _storageService.addCartProducts(product);
    products = _storageService.cartProducts;
    if (products != null) {
      print([products, "proooo"]);

      _navigationService.navigateTo(Routes.cartView);
    }
  }
}
