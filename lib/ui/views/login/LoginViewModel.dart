import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/services/AuthService.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();
  DialogService _dialogService = locator<DialogService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  void togglePassword(context) {
    obscureText = !obscureText;
    FocusScope.of(context).unfocus();

    notifyListeners();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  void validation() {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("All Fields Are Empty")));
    } else if (emailController.text.isEmpty) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Email is Empty")));
    } else if (!regExp.hasMatch(emailController.text)) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Please Try Valid Email")));
    } else if (passwordController.text.length < 8) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Password is too short")));
    } else if (passwordController.text.isEmpty) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("password is Empty")));
    } else {
      signIn();
    }
  }

  void goToSignUp() {
    _navigationService.replaceWith(Routes.signUpView);
  }

  Future signIn() async {
    setBusy(true);
    var result = await _authService.loginWithEmail(
        email: emailController.text, password: passwordController.text);

    if (result is bool) {
      if (result) {
        setBusy(false);
        _navigationService.replaceWith(Routes.homeView);
      } else {
        setBusy(false);
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }
}
