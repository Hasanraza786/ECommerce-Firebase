import 'package:eCommerce/ui/views/Cart/cartViewModel.dart';
import 'package:eCommerce/ui/widgets/CartViewWidgets.dart';
import 'package:eCommerce/ui/widgets/CustomAppBar.dart';
import 'package:eCommerce/ui/widgets/NotificationButton.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        onModelReady: (model) => model.setCount(),
        builder: (context, model, child) {
          return Scaffold(
              bottomNavigationBar: bottomNavigation(
                  context: context,
                  onPressed: () => model.goToCheckOut({}),
                  text: "Continous"),
              appBar: customAppBar(
                  context: context,
                  title: "Cart Page",
                  onPressedLeading: () => model.goBack(),
                  actions: [NotificationButton()]),
              body: ListView.builder(
                itemCount: model.cartproducts.length,
                itemBuilder: (context, index) {
                  return singleCartProduct(
                      context: context,
                      data: model.cartproducts[index],
                      quantity:
                          model.cartproducts[index]["quantity"].toString(),
                      onTapAdd: () => model.addQuantity(
                          value: model.cartproducts[index]["quantity"]),
                      onTapRemove: () => model.removeQuantity(
                          value: model.cartproducts[index]["quantity"]));
                },
              ));
        },
        viewModelBuilder: () => CartViewModel());
  }
}
