import 'package:auto_route/auto_route.dart';
import 'package:eCommerce/ui/views/CheckOut/checkOutViewModel.dart';
import 'package:eCommerce/ui/widgets/CartViewWidgets.dart';
import 'package:eCommerce/ui/widgets/CustomAppBar.dart';
import 'package:eCommerce/ui/widgets/NotificationButton.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CheckOutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckOutViewModel>.reactive(
        builder: (context, model, child) {
          // double price = double.parse(data["price"]);
          double discount = 3;
          double discountRupees;
          double shipping = 60;
          double totalRupees;

          // double subtotal = price * data["quantity"];
          // discountRupees = discount / 100 * subtotal;
          // totalRupees = subtotal + shipping - discountRupees;
          return Scaffold(
              bottomNavigationBar: bottomNavigation(
                  context: context, onPressed: () {}, text: "Buy"),
              appBar: customAppBar(
                  context: context,
                  title: "CheckOut Page",
                  onPressedLeading: () => model.goHome(),
                  actions: [NotificationButton()]),
              body: Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: model.checkoutproducts.length,
                          itemBuilder: (context, index) {
                            return singleCheckOutProduct(
                                context, model, model.checkoutproducts[index]);
                          },
                        ),
                      ),
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 150,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        bottomDetail(
                                            context: context,
                                            startName: "Your price",
                                            endName: "\$ "
                                            // subtotal.toStringAsFixed(2)
                                            ),
                                        bottomDetail(
                                            context: context,
                                            startName: "Discount",
                                            endName:
                                                discount.toStringAsFixed(2)),
                                        bottomDetail(
                                            context: context,
                                            startName: "Shipping",
                                            endName: "\$ " +
                                                shipping.toStringAsFixed(2)),
                                        bottomDetail(
                                            context: context,
                                            startName: "Total",
                                            endName: "\$ " +
                                                totalRupees.toStringAsFixed(2)),
                                      ])),
                            ]),
                      ),
                    ],
                  )));
        },
        viewModelBuilder: () => CheckOutViewModel());
  }
}
