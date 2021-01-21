// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:eCommerce/ui/views/Cart/cartView.dart';
import 'package:eCommerce/ui/views/CheckOut/checkOutView.dart';
import 'package:eCommerce/ui/views/DetailScreen/detailView.dart';
import 'package:eCommerce/ui/views/Home/homeView.dart';
import 'package:eCommerce/ui/views/ProductList/productListView.dart';
import 'package:eCommerce/ui/views/ProfileView/profileView.dart';
import 'package:eCommerce/ui/views/SignUp/signUpVIew.dart';
import 'package:eCommerce/ui/views/Welcome/welcomeView.dart';
import 'package:flutter/material.dart';
import '../ui/views/login/LoginView.dart';
import '../ui/views/startup/StartupView.dart';

class Routes {
  static const String startupView = '/';
  static const String loginView = '/login-view';
  static const String signUpView = '/signUp-view';
  static const String homeView = '/home-view';
  static const String productListView = '/productList-view';
  static const String detailView = '/detail-view';
  static const String cartView = '/cart-view';
  static const String checkOutView = '/checkOut-view';
  static const String welcomeView = '/welcome-view';
  static const String profileView = '/profile-view';

  static const all = <String>{
    startupView,
    loginView,
    signUpView,
    homeView,
    productListView,
    detailView,
    cartView,
    checkOutView,
    welcomeView,
    profileView,
  };
}

class Routerr extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.productListView, page: ProductListView),
    RouteDef(Routes.detailView, page: DetailView),
    RouteDef(Routes.cartView, page: CartView),
    RouteDef(Routes.checkOutView, page: CheckOutView),
    RouteDef(Routes.welcomeView, page: WelcomeView),
    RouteDef(Routes.profileView, page: ProfileView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    ProductListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProductListView(
          productList: data,
        ),
        settings: data,
      );
    },
    DetailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DetailView(
          imageDetail: data,
        ),
        settings: data,
      );
    },
    CartView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CartView(),
        settings: data,
      );
    },
    CheckOutView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CheckOutView(),
        settings: data,
      );
    },
    WelcomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileView(),
        settings: data,
      );
    },
  };
}
