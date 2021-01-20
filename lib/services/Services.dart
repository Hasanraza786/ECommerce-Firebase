import 'package:eCommerce/services/AuthService.dart';
import 'package:eCommerce/services/FireStoreService.dart';
import 'package:eCommerce/services/ThemeService.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class Services {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  ThemeService get themeService;
  @lazySingleton
  AuthService get authService;
  @lazySingleton
  FirebaseFirestoreService get firebaseFirestoreService;
}