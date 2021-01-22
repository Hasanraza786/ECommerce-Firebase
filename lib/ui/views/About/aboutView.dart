import 'package:eCommerce/ui/views/About/aboutViewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AboutViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold();
        },
        viewModelBuilder: () => AboutViewModel());
  }
}
