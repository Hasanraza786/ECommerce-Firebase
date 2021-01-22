import 'package:eCommerce/ui/theme/AppColors.dart';
import 'package:eCommerce/ui/widgets/ProductContainer/productContainer.dart';
import 'package:eCommerce/ui/widgets/busyButton.dart';
import 'package:flutter/material.dart';

Widget imageCard(context, data) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(13),
          child: Container(
            height: 220,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(data["image"]))),
          ),
        ),
      ),
    ),
  );
}

Widget imageCardDetail(context, data) {
  return Container(
    alignment: Alignment.centerLeft,
    height: 80,
    margin: EdgeInsets.only(
      top: 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(data["name"], style: Theme.of(context).textTheme.headline2),
        Text(
          "\$ ${data["price"]}",
          style: Theme.of(context)
              .textTheme
              .headline2
              .copyWith(color: AppColors.priceColor),
        ),
        Text("Description", style: Theme.of(context).textTheme.headline2),
      ],
    ),
  );
}

Widget imageCardDescription() {
  return Container(
    child: Wrap(children: [
      Text(
          " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vestibulum, metus ac tristique porttitor, neque lectus laoreet risus, nec faucibus mauris justo at neque. Aliquam dolor nisi, luctus sit amet hendrerit convallis, semper eget justo. Nunc dolor mi, tincidunt ut diam ac, ornare vestibulum mauris. Vestibulum finibus lacus ac diam blandit consectetur. Nullam ultricies elementum nisi, sed tempor velit laoreet et. Donec volutpat interdum magna vel pretium."),
    ]),
  );
}

Widget sizeContainer(
  context,
) {
  return Column(children: [
    SizedBox(
      height: 15,
    ),
    Container(
      alignment: Alignment.centerLeft,
      child: Text("Size", style: Theme.of(context).textTheme.headline2),
    ),
    SizedBox(
      height: 15,
    ),
  ]);
}

Widget colorContainer(
  context,
) {
  return Column(
    children: [
      SizedBox(
        height: 15,
      ),
      Container(
        alignment: Alignment.centerLeft,
        child: Text("Color", style: Theme.of(context).textTheme.headline2),
      ),
      SizedBox(
        height: 15,
      ),
    ],
  );
}

Widget quantityContainer(context, model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 15,
      ),
      Container(
        child: Text("Quantity", style: Theme.of(context).textTheme.headline2),
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        margin: EdgeInsets.only(bottom: 20),
        height: 35,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.blue[200], borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                child: Icon(Icons.remove), onTap: () => model.removeQuantity()),
            Text(
              model.count.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
            GestureDetector(
                child: Icon(Icons.add), onTap: () => model.addQuantity())
          ],
        ),
      ),
    ],
  );
}

Widget button({onPressed}) {
  return BusyButton(
    title: "Check Out",
    onPressed: onPressed,
    cardColor: Colors.pink,
  );
}
