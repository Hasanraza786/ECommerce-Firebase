import 'package:eCommerce/ui/widgets/busyButton.dart';
import 'package:eCommerce/ui/widgets/passwordTextfield.dart';
import 'package:eCommerce/ui/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:eCommerce/ui/views/login/LoginViewModel.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          key: model.scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: Form(
            key: model.formKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 300,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(fontSize: 50, color: Colors.black),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              hintText: "Email",
                              controller: model.emailController,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),
                            PasswordTextField(
                              hintText: "Password",
                              controller: model.passwordController,
                              obscureText: model.obscureText,
                              onTap: () => model.togglePassword(context),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.text,
                            ),
                            BusyButton(
                              busy: model.isBusy,
                              enabled: !model.isBusy,
                              title: "Login",
                              onPressed: () {
                                model.validation();
                              },
                            ),
                            Row(children: [
                              Text("I Have Not Account!"),
                              GestureDetector(
                                  onTap: () => model.goToSignUp(),
                                  child: Text(
                                    "SignUp",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .copyWith(color: Colors.cyan),
                                  ))
                            ]),
                          ]))
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
