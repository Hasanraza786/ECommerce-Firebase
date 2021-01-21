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
        onModelReady: (model) => model.setCheckOut(),
        builder: (context, model, child) {
          double subTotal;
          double discount = 3;
          double discountRupees;
          double shipping = 60;
          double totalRupees;
          for (var i = 0; i < model.checkoutproducts.length; i++) {
            subTotal = double.parse(model.checkoutproducts[i]["price"]) *
                model.checkoutproducts[i]["quantity"];
            discountRupees = discount / 100 * subTotal;
            totalRupees = subTotal + shipping - discountRupees;
            print(["Asdasda", subTotal, discountRupees, totalRupees]);
          }
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
                                context: context,
                                model: model,
                                data: model.checkoutproducts[index],
                                onPressed: () => model.deleteProduct(index));
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
                                        model.checkoutproducts != null &&
                                                subTotal != null
                                            ? bottomDetail(
                                                context: context,
                                                startName: "Your price",
                                                endName: "\$ " +
                                                    subTotal.toStringAsFixed(2))
                                            : bottomDetail(
                                                context: context,
                                                startName: "Your price",
                                                endName: "\$ 0"),
                                        bottomDetail(
                                            context: context,
                                            startName: "Discount",
                                            endName: " \$ " +
                                                discount.toStringAsFixed(2)),
                                        bottomDetail(
                                            context: context,
                                            startName: "Shipping",
                                            endName: "\$ " +
                                                shipping.toStringAsFixed(2)),
                                        model.checkoutproducts != null &&
                                                totalRupees != null
                                            ? bottomDetail(
                                                context: context,
                                                startName: "Total",
                                                endName: totalRupees != null
                                                    ? "\$ " +
                                                        totalRupees
                                                            .toStringAsFixed(2)
                                                    : "")
                                            : bottomDetail(
                                                context: context,
                                                startName: "Total",
                                                endName: "\$ 0"),
                                      ])),
                            ]),
                      ),
                    ],
                  )));
        },
        viewModelBuilder: () => CheckOutViewModel());
  }
}
