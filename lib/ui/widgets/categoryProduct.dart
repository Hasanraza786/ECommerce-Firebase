import 'package:flutter/material.dart';

class CategoryProduct extends StatelessWidget {
  final IconData image;
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
          child: Icon(
            image,
            size: 45,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
