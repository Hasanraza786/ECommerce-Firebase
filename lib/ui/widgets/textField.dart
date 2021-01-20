import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  final TextEditingController controller;

  CustomTextField({
    this.hintText,
    this.icon,
    this.textInputAction,
    this.textInputType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black),
      ),
      keyboardType: textInputType,
      textInputAction: textInputAction,
    );
  }
}
