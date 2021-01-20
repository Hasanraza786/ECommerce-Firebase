import 'package:flutter/material.dart';

class CartModel {
  String image, name, price;
  int quantity;

  CartModel(
      {@required this.image,
      @required this.name,
      @required this.price,
      @required this.quantity});
}
