import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/models/productModel.dart';
import 'package:eCommerce/services/FireStoreService.dart';
// import 'package:eCommerce/services/FirebaseAuthService.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  NavigationService _navigationService = locator<NavigationService>();
  FirebaseFirestoreService _firestoreService =
      locator<FirebaseFirestoreService>();
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
    await _firestoreService.getFeatureProducts();
    var result = _firestoreService.featureProductsData;

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
    await _firestoreService.getArchivesProducts();
    var result = _firestoreService.archiveProductsData;

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
    await _firestoreService.getHomeFeature();
    var result = _firestoreService.homefeatureData;

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
    await _firestoreService.getHomeArchives();
    var result = _firestoreService.homearchiveData;

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
    await _firestoreService.getCategoryIcon();
    var result = _firestoreService.categoryIconData;

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
    await _firestoreService.getDress();
    var dress = _firestoreService.dress;
    if (dress != null) {
      dressData = dress;
    }
    await _firestoreService.getPants();
    var pant = _firestoreService.pants;
    if (pant != null) {
      pantData = pant;
    }
    await _firestoreService.getShirts();
    var shirt = _firestoreService.shirts;
    if (shirt != null) {
      shirtData = shirt;
    }
    await _firestoreService.getShoes();
    var shoe = _firestoreService.shoes;
    if (shoe != null) {
      shoeData = shoe;
    }
    await _firestoreService.getTies();
    var tie = _firestoreService.ties;
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
