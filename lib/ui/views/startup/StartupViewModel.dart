// import 'dart:async';
import 'dart:async';

import 'package:eCommerce/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:eCommerce/services/AuthService.dart';

import 'package:stacked_services/stacked_services.dart';
import 'package:eCommerce/app/router.gr.dart';

class StartupViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();

  Future handleStartUpLogic() async {
    Timer(Duration(seconds: 2), () async {
      bool hasLoggedInUser = await _authService.isUserLoggedIn();
      if (hasLoggedInUser == true) {
        _navigationService.replaceWith(Routes.homeView);
      } else {
        _navigationService.replaceWith(Routes.loginView);
      }
    });
  }
}
