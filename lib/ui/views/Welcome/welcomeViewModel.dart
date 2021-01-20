import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  void goToLogin() {
    _navigationService.replaceWith(Routes.loginView);
  }

  void goToSignUp() {
    _navigationService.replaceWith(Routes.signUpView);
  }
}
