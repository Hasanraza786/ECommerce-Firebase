import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/models/userModel.dart';
import 'package:eCommerce/services/AuthService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DrawerViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();

  bool homeColor = true;
  bool cartColor = false;
  bool aboutColor = false;
  bool contactColor = false;
  bool profileColor = false;

  UserModel get user => _authService.currentUser;

  void changeColor({a, b, c, d, color}) {
    notifyListeners();
  }

  Future signOut() async {
    await _authService.logOut();
    _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
  }

  void goToProfile() {
    _navigationService.navigateTo(Routes.profileView);
  }
}
