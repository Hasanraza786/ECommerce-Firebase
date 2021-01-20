import 'package:flutter/material.dart';

Widget singleContainer({context, startText, endText}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        height: 50,
        width: double.infinity,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            startText ?? "",
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(color: Colors.black45, fontWeight: FontWeight.w500),
          ),
          Text(
            endText ?? "",
            style: Theme.of(context).textTheme.headline2,
          )
        ])),
  );
}

Widget singleTextField({context, name, controller}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      hintText: name ?? "",
      hintStyle: Theme.of(context)
          .textTheme
          .headline2
          .copyWith(color: Colors.black45, fontWeight: FontWeight.w500),
    ),
  );
}
