import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:eCommerce/services/FireStoreService.dart';

class CartViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  FirebaseFirestoreService _firestoreService = locator<FirebaseFirestoreService>();

  void addQuantity() {
    count++;
    notifyListeners();
  }

  int count;

  void setCount(value) {
    count = value;
    notifyListeners();
  }

  void removeQuantity() {
    if (count > 1) {
      count--;
    }
    notifyListeners();
  }

  void goBack() {
    _navigationService.popRepeated(1);
  }

  void goToCheckOut(data) {
    _firestoreService.addNotification("notification");
    _navigationService.navigateTo(Routes.checkOutView, arguments: data);
  }
}
