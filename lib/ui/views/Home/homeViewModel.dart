import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/models/productModel.dart';
import 'package:eCommerce/services/storageService.dart';
// import 'package:eCommerce/services/FirebaseAuthService.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  NavigationService _navigationService = locator<NavigationService>();
  StorageService _storageService = locator<StorageService>();
  // FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();

  ProductModel menShirtData;
  ProductModel womenWatchData;
  ProductModel smartPhoneData;
  ProductModel keyboardData;
  ProductModel menGlassesData;
  ProductModel womenGlassesData;
  ProductModel menShoesData;
  ProductModel womenShoesData;

  void goToProductList(Map name) {
    _navigationService.navigateTo(Routes.productListView, arguments: name);
  }

  void goToDetailView(Map detail) {
    _navigationService.navigateTo(Routes.detailView, arguments: detail);
  }

  List featureProducts = [];
  List archiveProducts = [];
  List homeFeaturesProducts = [];
  List homeArchivesProducts = [];
  List dressData = [];
  List pantData = [];
  List shirtData = [];
  List shoeData = [];
  List tieData = [];
  String dressIcon;
  String shirtIcon;
  String shoeIcon;
  String pantIcon;
  String tieIcon;

  Future getFeature() async {
    await _storageService.getFeatureProducts();
    var result = _storageService.featureProductsData;

    if (result != null) {
      featureProducts = result;
      menShirtData = ProductModel(
          image: result[0]["image"],
          name: result[0]["name"],
          price: result[0]["price"]);
      womenWatchData = ProductModel(
          image: result[1]["image"],
          name: result[1]["name"],
          price: result[1]["price"]);

      notifyListeners();
    }
  }

  Future getArchive() async {
    await _storageService.getArchivesProducts();
    var result = _storageService.archiveProductsData;

    if (result != null) {
      archiveProducts = result;
      smartPhoneData = ProductModel(
          image: result[0]["image"],
          name: result[0]["name"],
          price: result[0]["price"]);
      keyboardData = ProductModel(
          image: result[1]["image"],
          name: result[1]["name"],
          price: result[1]["price"]);

      notifyListeners();
    }
  }

  Future getHomeFeatures() async {
    await _storageService.getHomeFeature();
    var result = _storageService.homefeatureData;

    if (result != null) {
      homeFeaturesProducts = result;
      menGlassesData = ProductModel(
          image: result[0]["image"],
          name: result[0]["name"],
          price: result[0]["price"]);
      womenGlassesData = ProductModel(
          image: result[1]["image"],
          name: result[1]["name"],
          price: result[1]["price"]);
    }
    notifyListeners();
  }

  Future getHomeArchives() async {
    await _storageService.getHomeArchives();
    var result = _storageService.homearchiveData;

    if (result != null) {
      homeArchivesProducts = result;
      menShoesData = ProductModel(
          image: result[0]["image"],
          name: result[0]["name"],
          price: result[0]["price"]);
      womenShoesData = ProductModel(
          image: result[1]["image"],
          name: result[1]["name"],
          price: result[1]["price"]);
    }
    notifyListeners();
  }

  Future getCategoryIcons() async {
    await _storageService.getCategoryIcon();
    var result = _storageService.categoryIconData;

    if (result != null) {
      dressIcon = result[0]["image"];
      shirtIcon = result[1]["image"];
      shoeIcon = result[2]["image"];
      pantIcon = result[3]["image"];
      tieIcon = result[4]["image"];
    }
    notifyListeners();
  }

  Future getCategoriesData() async {
    await _storageService.getDress();
    var dress = _storageService.dress;
    if (dress != null) {
      dressData = dress;
    }
    await _storageService.getPants();
    var pant = _storageService.pants;
    if (pant != null) {
      pantData = pant;
    }
    await _storageService.getShirts();
    var shirt = _storageService.shirts;
    if (shirt != null) {
      shirtData = shirt;
    }
    await _storageService.getShoes();
    var shoe = _storageService.shoes;
    if (shoe != null) {
      shoeData = shoe;
    }
    await _storageService.getTies();
    var tie = _storageService.ties;
    if (tie != null) {
      tieData = tie;
    }
    notifyListeners();
  }

  void getProducts() async {
    await getFeature();
    await getArchive();
    await getCategoriesData();
    await getHomeFeatures();
    await getHomeArchives();
    await getCategoryIcons();
    notifyListeners();
  }
}
