import 'package:auto_route/auto_route.dart';
import 'package:eCommerce/ui/views/ProductList/productListViewModel.dart';
import 'package:eCommerce/ui/widgets/SingleProduct.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductListView extends StatelessWidget {
  final RouteData productList;
  const ProductListView({@required this.productList});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductListViewModel>.reactive(
        onModelReady: (model) => model.getProducts(),
        builder: (context, model, child) {
          Map data = productList.arguments;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () => model.backToHome()),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                    ),
                    onPressed: () {}),
              ],
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data["name"],
                                    style:
                                        Theme.of(context).textTheme.headline3),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 660,
                        child: GridView.builder(
                          itemCount: data["list"].length,
                          itemBuilder: (context, index) => SingleProduct(
                            image: data["list"][index]["image"],
                            name: data["list"][index]["name"],
                            price: data["list"][index]["price"],
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                            childAspectRatio: .63,
                            mainAxisSpacing: 20,
                          ),

                          scrollDirection: Axis.vertical,
                          // children: [
                          //   SingleProduct(
                          //     image: "man.png",
                          //     name: "Men Long T-Sirt",
                          //     price: "30.0",
                          //   ),
                          //   SingleProduct(
                          //     image: "watch.jpg",
                          //     name: "Women Watch",
                          //     price: "33.0",
                          //   ),
                          //   SingleProduct(
                          //     image: "mobilecover.webp",
                          //     name: "Mobile Cover",
                          //     price: "40.0",
                          //   ),
                          //   SingleProduct(
                          //     image: "mp3.jpg",
                          //     name: "Google Mp3",
                          //     price: "25.0",
                          //   ),
                          //   SingleProduct(
                          //     image: "camera.jpg",
                          //     name: "Camera",
                          //     price: "20.0",
                          //   ),
                          //   SingleProduct(
                          //     image: "mouse.jpg",
                          //     name: "Mouse",
                          //     price: "10.0",
                          //   ),
                          // ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => ProductListViewModel());
  }
}
