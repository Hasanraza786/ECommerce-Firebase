import 'package:eCommerce/ui/views/Welcome/welcomeViewModel.dart';
import 'package:eCommerce/ui/widgets/busyButton.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.asset("assets/images/shopping.png"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome",
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 32),
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ready To Start Shopping Sign Up",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          "To get Started",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BusyButton(
                    title: "Sign Up",
                    onPressed: () => model.goToSignUp(),
                    cardColor: Color(0xff746bc9),
                    textColor: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Already have an account?",
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              color: Color(0xff746bc9),
                            ),
                      ),
                      GestureDetector(
                        onTap: () => model.goToLogin(),
                        child: Text("Login",
                            style:
                                Theme.of(context).textTheme.headline2.copyWith(
                                      color: Color(0xff746bc9),
                                    )),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => WelcomeViewModel());
  }
}
