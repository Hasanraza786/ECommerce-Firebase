import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/services/fireStoreService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckOutViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  FirebaseFirestoreService _firestoreService =
      locator<FirebaseFirestoreService>();
  int count = 1;

  void goBack() {
    _navigationService.popRepeated(1);
  }

  void goHome() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
  }

  List checkoutproducts = [];

  void setCart() {
    checkoutproducts = _firestoreService.cartProducts;
    notifyListeners();
  }
}
