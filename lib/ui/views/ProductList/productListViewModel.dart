import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/services/storageService.dart';
// import 'package:eCommerce/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductListViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  StorageService _storageService = locator<StorageService>();

  void backToHome() {
    _navigationService.popRepeated(1);
  }

  Future getList({list, isCategory}) async {
    isCategory == true
        ? _storageService.getSearchCategory(list: list)
        : _storageService.getSearchProduct(list: list);

    notifyListeners();
  }

// List featureProducts

  Future getFeature() async {
    await _storageService.getFeatureProducts();

    notifyListeners();
  }

  Future getArchive() async {
    await _storageService.getArchivesProducts();

    notifyListeners();
  }

  void getProducts({list, isCategory}) async {
    await getList(list: list, isCategory: isCategory);
    await getFeature();
    await getArchive();
    notifyListeners();
  }

  void goDetail(Map detail) {
    _navigationService.replaceWith(Routes.detailView, arguments: detail);
  }
}
