import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final String name;
  final Color color;

  const ProductContainer({
    this.name,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 40,
      color: color ?? Color(0xfff2f2f2),
      child: Text(
        name ?? "",
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
