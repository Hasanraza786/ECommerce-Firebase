import 'package:eCommerce/ui/views/ContactUs/contactUsViewMode.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContactUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactUsViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold();
        },
        viewModelBuilder: () => ContactUsViewModel());
  }
}
