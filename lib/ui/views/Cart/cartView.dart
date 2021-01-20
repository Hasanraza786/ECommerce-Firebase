import 'package:auto_route/auto_route.dart';
import 'package:eCommerce/ui/views/Cart/cartViewModel.dart';
import 'package:eCommerce/ui/widgets/CartViewWidgets.dart';
import 'package:eCommerce/ui/widgets/CustomAppBar.dart';
import 'package:eCommerce/ui/widgets/NotificationButton.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  final RouteData cartDetail;
  CartView({this.cartDetail});
  @override
  Widget build(BuildContext context) {
    Map data = cartDetail.arguments;

    return ViewModelBuilder<CartViewModel>.reactive(
        onModelReady: (model) => model.setCount(data["quantity"]),
        builder: (context, model, child) {
          return Scaffold(
              bottomNavigationBar: bottomNavigation(
                  context: context,
                  onPressed: () => model.goToCheckOut({
                        "image": data["image"],
                        "name": data["name"],
                        "price": data["price"],
                        "quantity": model.count
                      }),
                  text: "Continous"),
              appBar: customAppBar(
                  context: context,
                  title: "Cart Page",
                  onPressedLeading: () => model.goBack(),
                  actions: [NotificationButton()]),
              body: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return singleCartProduct(
                    context,
                    model,
                    {
                      "image": data["image"],
                      "name": data["name"],
                      "price": data["price"],
                      "quantity": model.count
                    },
                  );
                },
              ));
        },
        viewModelBuilder: () => CartViewModel());
  }
}
