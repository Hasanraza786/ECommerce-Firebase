import 'package:auto_route/auto_route.dart';
import 'package:eCommerce/ui/views/DetailScreen/detailViewmodel.dart';
import 'package:eCommerce/ui/widgets/CustomAppBar.dart';
import 'package:eCommerce/ui/widgets/DetailViewWidgets.dart';
import 'package:eCommerce/ui/widgets/NotificationButton.dart';
import 'package:eCommerce/ui/widgets/ProductContainer/productContainer.dart';
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
                      sizeContainer(
                        context,
                      ),
                      Container(
                          width: 265,
                          child: ToggleButtons(
                            children: [
                              Text("S"),
                              Text("M"),
                              Text("L"),
                              Text("XL"),
                            ],
                            onPressed: (index) =>
                                model.setIndex(index, model.isSelected),
                            isSelected: model.isSelected,
                          )),
                      colorContainer(
                        context,
                      ),
                      Container(
                          width: 265,
                          child: ToggleButtons(
                            renderBorder: false,
                            selectedColor: Color(0xff746bc9),
                            children: [
                              ProductContainer(
                                color: Colors.blue[200],
                              ),
                              ProductContainer(
                                color: Colors.green[200],
                              ),
                              ProductContainer(
                                color: Colors.yellow[200],
                              ),
                              ProductContainer(
                                color: Colors.cyan[300],
                              ),
                            ],
                            onPressed: (index) =>
                                model.setIndex(index, model.colored),
                            isSelected: model.colored,
                          )),
                      quantityContainer(context, model),
                      button(
                          onPressed: () => model.addCart({
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
