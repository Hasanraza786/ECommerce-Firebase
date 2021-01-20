import 'package:flutter/material.dart';

class CategoryProduct extends StatelessWidget {
  final String image;
  final Color color;
  final Function onTap;

  CategoryProduct({this.image, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        maxRadius: 32,
        backgroundColor: color,
        child: Container(
          color: Colors.transparent,
          height: 40,
          child: Image(
            // color: Colors.white,
            image: NetworkImage(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
