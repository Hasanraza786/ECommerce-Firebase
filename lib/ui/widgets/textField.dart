import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String initialText;
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
    this.initialText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialText,
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
