import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  final Function onTap;
  final bool obscureText;
  final TextEditingController controller;
  PasswordTextField(
      {this.hintText,
      this.textInputAction,
      this.textInputType,
      this.onTap,
      this.obscureText,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.black)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(
                obscureText == true ? Icons.visibility : Icons.visibility_off),
          )),
      obscureText: obscureText,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
    );
  }
}
