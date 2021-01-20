import 'package:flutter/material.dart';
import 'package:eCommerce/ui/views/startup/StartupViewModel.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: CircularProgressIndicator()),
              SizedBox(height: 40),
              Center(child: Text('Splash screen will be here'))
            ],
          ),
        );
      },
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
