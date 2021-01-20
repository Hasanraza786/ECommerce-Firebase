import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String name, image;
  final String price;
  final Function onTap;

  SingleProduct({this.name, this.image, this.price, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          height: 225,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 170,
                  width: 140,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            image ?? "",
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              Text("\$ $price",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Color(0xff9b96d6))),
              Text(
                name,
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
