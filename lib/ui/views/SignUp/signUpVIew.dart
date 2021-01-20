import 'package:eCommerce/ui/views/SignUp/signUpViewModel.dart';
import 'package:eCommerce/ui/widgets/busyButton.dart';
import 'package:eCommerce/ui/widgets/passwordTextfield.dart';
import 'package:eCommerce/ui/widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          key: model.scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Form(
              key: model.formKey,
              child: Container(
                child: Column(children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 200,
                    child: Text(
                      "Register",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(fontSize: 50, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 450,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextField(
                          hintText: "UserName",
                          textInputType: TextInputType.text,
                          controller: model.userNameController,
                          textInputAction: TextInputAction.next,
                        ),
                        CustomTextField(
                          hintText: "Email",
                          controller: model.emailController,
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        PasswordTextField(
                          hintText: "Password",
                          obscureText: model.obscureText,
                          controller: model.passwordController,
                          onTap: () => model.togglePassword(context),
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                        ),
                        GestureDetector(
                          onTap: () => model.toggleGender(),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            padding: EdgeInsets.only(left: 10),
                            height: 55,
                            width: double.infinity,
                            child: Center(
                              child: Row(
                                children: [
                                  Text(
                                    model.isMale == true ? "Male" : "Female",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CustomTextField(
                          hintText: "Phone Number",
                          controller: model.numberController,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                        ),
                        BusyButton(
                          busy: model.isBusy,
                          enabled: !model.isBusy,
                          title: "  Register",
                          onPressed: () {
                            model.validation();
                          },
                        ),
                        Row(children: [
                          Text("I Have an Account!"),
                          GestureDetector(
                              onTap: () => model.goToLogin(),
                              child: Text(
                                "Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(color: Colors.cyan),
                              ))
                        ]),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
