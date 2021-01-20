import 'package:eCommerce/ui/theme/AppColors.dart';
import 'package:eCommerce/ui/views/Home/homeViewModel.dart';
import 'package:eCommerce/ui/widgets/CustomAppBar.dart';
import 'package:eCommerce/ui/widgets/Drawer/drawerView.dart';
import 'package:eCommerce/ui/widgets/NotificationButton.dart';
import 'package:eCommerce/ui/widgets/SingleProduct.dart';
import 'package:eCommerce/ui/widgets/categoryProduct.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        onModelReady: (model) => model.getProducts(),
        builder: (context, model, child) {
          return Scaffold(
              key: model.scaffoldKey,
              drawer: DrawerView(),
              appBar: customAppBar(
                leadingIcon: Icons.menu,
                context: context,
                title: "Home View",
                onPressedLeading: () =>
                    model.scaffoldKey.currentState.openDrawer(),
                actions: [
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      onPressed: () {}),
                  NotificationButton(),
                ],
              ),
              body: model.menGlassesData != null &&
                      model.menShoesData != null &&
                      model.dressIcon != null
                  ? Container(
                      height: double.infinity,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ListView(children: [
                        Container(
                            width: double.infinity,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 240,
                                    child: Carousel(
                                      autoplay: true,
                                      showIndicator: false,
                                      images: [
                                        AssetImage("assets/images/manpant.png"),
                                        AssetImage("assets/images/watch.jpg"),
                                        AssetImage("assets/images/camera.jpg")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Categories",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    child: Row(
                                      children: [
                                        CategoryProduct(
                                            onTap: () => model.goToProductList({
                                                  "name": "Dress",
                                                  "list": model.dressData
                                                }),
                                            color: AppColors.dressColor,
                                            image: model.dressIcon),
                                        CategoryProduct(
                                            onTap: () => model.goToProductList({
                                                  "name": "Shirt",
                                                  "list": model.shirtData
                                                }),
                                            color: AppColors.shirtColor,
                                            image: model.shirtIcon),
                                        CategoryProduct(
                                          onTap: () => model.goToProductList({
                                            "name": "Shoe",
                                            "list": model.shoeData
                                          }),
                                          color: AppColors.shoeColor,
                                          image: model.shoeIcon,
                                        ),
                                        CategoryProduct(
                                            onTap: () => model.goToProductList({
                                                  "name": "Pant",
                                                  "list": model.pantData
                                                }),
                                            color: AppColors.pantColor,
                                            image: model.pantIcon),
                                        CategoryProduct(
                                            onTap: () => model.goToProductList({
                                                  "name": "Tie",
                                                  "list": model.tieData
                                                }),
                                            color: AppColors.tieColor,
                                            image: model.tieIcon)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Featured",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      GestureDetector(
                                        onTap: () => model.goToProductList({
                                          "name": "Featured",
                                          "list": model.featureProducts
                                        }),
                                        child: Text("View more",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SingleProduct(
                                        onTap: () => model.goToDetailView({
                                          "image": model.menGlassesData.image,
                                          "name": model.menGlassesData.name,
                                          "price": model.menGlassesData.price,
                                        }),
                                        image: model.menGlassesData.image,
                                        name: model.menGlassesData.name,
                                        price: model.menGlassesData.price,
                                      ),
                                      SingleProduct(
                                        onTap: () => model.goToDetailView({
                                          "image": model.womenGlassesData.image,
                                          "name": model.womenGlassesData.name,
                                          "price": model.womenGlassesData.price,
                                        }),
                                        image: model.womenGlassesData.image,
                                        name: model.womenGlassesData.name,
                                        price: model.womenGlassesData.price,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 70,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("New Archives",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                        GestureDetector(
                                          onTap: () => model.goToProductList({
                                            "name": "New Archives",
                                            "list": model.archiveProducts
                                          }),
                                          child: Text("View more",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () =>
                                                    model.goToDetailView({
                                                  "image":
                                                      model.menShoesData.image,
                                                  "name":
                                                      model.menShoesData.name,
                                                  "price":
                                                      model.menShoesData.price,
                                                }),
                                                child: SingleProduct(
                                                  image:
                                                      model.menShoesData.image,
                                                  name: model.menShoesData.name,
                                                  price:
                                                      model.menShoesData.price,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () =>
                                                    model.goToDetailView({
                                                  "image": model
                                                      .womenShoesData.image,
                                                  "name":
                                                      model.womenShoesData.name,
                                                  "price": model
                                                      .womenShoesData.price,
                                                }),
                                                child: SingleProduct(
                                                  image: model
                                                      .womenShoesData.image,
                                                  name:
                                                      model.womenShoesData.name,
                                                  price: model
                                                      .womenShoesData.price,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ]))
                      ]))
                  : Center(child: CircularProgressIndicator()));
        },
        viewModelBuilder: () => HomeViewModel());
  }
}
