import 'package:flutter/material.dart';

Widget customAppBar(
    {context,
    title,
    onPressedLeading,
    leadingIcon,
    Widget leadingWidget,
    List<Widget> actions}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.grey[100],
    title: Text(
      title ?? "",
      style: Theme.of(context).textTheme.headline6,
    ),
    leading: leadingWidget ??
        IconButton(
            icon: Icon(
              leadingIcon ?? Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: onPressedLeading),
    actions: actions,
  );
}
