import 'package:eCommerce/ui/theme/AppColors.dart';
import 'package:flutter/material.dart';

Widget singleCartProduct(
    {context,
    Function onPressed,
    Map data,
    quantity,
    Function onTapRemove,
    Function onTapAdd}) {
  return Container(
      height: 140,
      width: double.infinity,
      child: Card(
        child: Row(
          children: [
            Container(
              width: 140,
              height: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(data['image']))),
            ),
            Container(
              height: 140,
              width: 200,
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data["name"],
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.close,
                                color: AppColors.priceColor,
                                size: 20,
                              ),
                              onPressed: onPressed)
                        ],
                      ),
                    ),
                    Text(
                      "Clothes",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      "\$ ${data["price"]}",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: AppColors.priceColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 30,
                      width: 110,
                      color: Color(0xfff2f2f2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              child: Icon(Icons.remove), onTap: onTapRemove),
                          Text(
                            quantity,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          GestureDetector(
                              child: Icon(Icons.add), onTap: onTapAdd)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ));
}

Widget bottomNavigation({
  context,
  onPressed,
  text,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    padding: EdgeInsets.only(bottom: 10),
    height: 60,
    width: 100,
    child: RaisedButton(
      color: Color(0xff746bc9),
      onPressed: onPressed,
      child: Text(
        text ?? "",
        style:
            Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),
      ),
    ),
  );
}

// CheckOut Widgets

Widget singleCheckOutProduct({context, model, data, onPressed}) {
  return Container(
      height: 150,
      width: MediaQuery.of(context).size.width * 1,
      child: Card(
        child: Row(
          children: [
            Container(
              width: 137,
              height: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(data['image']))),
            ),
            Container(
              height: 140,
              width: 185,
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 160,
                      height: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data["name"],
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.close,
                                color: AppColors.priceColor,
                                size: 20,
                              ),
                              onPressed: onPressed)
                        ],
                      ),
                    ),
                    Text(
                      "Clothes",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      "\$ ${data["price"]}",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: AppColors.priceColor),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 30,
                      width: 100,
                      color: Color(0xfff2f2f2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Quantity",
                              style: Theme.of(context).textTheme.headline2),
                          Text(
                            data["quantity"].toString(),
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ));
}

Widget bottomDetail({context, startName, endName}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(startName, style: Theme.of(context).textTheme.headline2),
      Text(endName, style: Theme.of(context).textTheme.headline2)
    ],
  );
}
