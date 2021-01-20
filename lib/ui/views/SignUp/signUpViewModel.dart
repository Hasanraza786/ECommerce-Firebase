import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/services/AuthService.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  AuthService _authService = locator<AuthService>();
  DialogService _dialogService = locator<DialogService>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  bool obscureText = true;

  bool isMale = true;

  void toggleGender() {
    isMale = !isMale;
    notifyListeners();
  }

  void togglePassword(context) {
    obscureText = !obscureText;
    FocusScope.of(context).unfocus();

    notifyListeners();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  void validation() {
    if (userNameController.text.isEmpty &&
        emailController.text.isEmpty &&
        passwordController.text.isEmpty &&
        numberController.text.isEmpty) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("All Field Are Empty")));
    } else if (userNameController.text.length < 6) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Name Must be 6")));
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
    } else if (numberController.text.length < 11 ||
        numberController.text.length > 11) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Phone Number Must be 11")));
    } else {
      signUp();
    }
  }

  void goToLogin() {
    _navigationService.replaceWith(Routes.loginView);
  }

  Future signUp() async {
    setBusy(true);
    var result = await _authService.signUpWithEmail(
        email: emailController.text,
        password: passwordController.text,
        name: userNameController.text,
        gender: isMale == true ? "Male" : "Female",
        phoneNumber: numberController.text);
    if (result is bool) {
      if (result) {
        setBusy(false);

        _navigationService.replaceWith(Routes.loginView);
      } else {
        setBusy(false);

        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}
