import 'package:auto_route/auto_route.dart';
import 'package:eCommerce/ui/views/DetailScreen/detailViewmodel.dart';
import 'package:eCommerce/ui/widgets/CustomAppBar.dart';
import 'package:eCommerce/ui/widgets/DetailViewWidgets.dart';
import 'package:eCommerce/ui/widgets/NotificationButton.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DetailView extends StatelessWidget {
  final RouteData imageDetail;

  DetailView({this.imageDetail});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailViewModel>.reactive(
        builder: (context, model, child) {
          Map data = imageDetail.arguments;
          return Scaffold(
            appBar: customAppBar(
                onPressedLeading: () => model.backToHome(),
                context: context,
                title: "Detail Page",
                actions: [NotificationButton()]),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      imageCard(context, data),
                      imageCardDetail(context, data),
                      imageCardDescription(),
                      sizeContainer(context, model),
                      colorContainer(context, model),
                      quantityContainer(context, model),
                      button(
                          onPressed: () => model.goToCartView({
                                "image": data["image"],
                                "name": data["name"],
                                "price": data["price"],
                                "quantity": model.count,
                              }))
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => DetailViewModel());
  }
}
