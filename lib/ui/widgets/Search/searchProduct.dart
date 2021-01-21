import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/services/storageService.dart';
import 'package:eCommerce/ui/widgets/SingleProduct.dart';
import 'package:flutter/material.dart';

class SearchProduct extends SearchDelegate {
  final StorageService _storageService = locator<StorageService>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = " ";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List searchProduct = _storageService.searchProductList(query);
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.87,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: searchProduct
          .map((e) => SingleProduct(
                image: e["image"],
                name: e["name"],
                price: e["price"],
              ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List searchProduct = _storageService.searchProductList(query);
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.70,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: searchProduct
          .map((e) => SingleProduct(
                image: e["image"],
                name: e["name"],
                price: e["price"],
              ))
          .toList(),
    );
  }
}
