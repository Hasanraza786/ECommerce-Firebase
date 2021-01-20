import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/services/FireStoreService.dart';
// import 'package:eCommerce/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductListViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  FirebaseFirestoreService _firestoreService =
      locator<FirebaseFirestoreService>();

  void backToHome() {
    _navigationService.popRepeated(1);
  }

// List featureProducts

  Future getFeature() async {
    await _firestoreService.getFeatureProducts();

    notifyListeners();
  }

  Future getArchive() async {
    await _firestoreService.getArchivesProducts();

    notifyListeners();
  }

  void getProducts() async {
    await getFeature();
    await getArchive();
    notifyListeners();
  }
}
