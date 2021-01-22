import 'package:eCommerce/ui/widgets/Drawer/drawerViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerViewModel>.reactive(
        builder: (context, model, child) {
          return model.user.name != null && model.user.email != null
              ? Drawer(
                  child: ListView(children: [
                    UserAccountsDrawerHeader(
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: model.user.image == ""
                              ? AssetImage("assets/images/profile.jpg")
                              : NetworkImage(
                                  model.user.image,
                                ),
                        ),
                        decoration: BoxDecoration(color: Color(0xfff2f2f2)),
                        accountName: Text(
                            model.user.name != null ? model.user.name : "",
                            style: Theme.of(context).textTheme.subtitle1),
                        accountEmail: Text(
                            model.user.email != null ? model.user.email : "",
                            style: Theme.of(context).textTheme.subtitle2)),
                    ListTile(
                      onTap: () {
                        model.changeColor(
                            a: model.cartColor = false,
                            b: model.aboutColor = false,
                            c: model.contactColor = false,
                            d: model.profileColor = false,
                            color: model.homeColor = true);
                      },
                      selected: model.homeColor,
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                    ListTile(
                      onTap: () {
                        model.changeColor(
                            a: model.homeColor = false,
                            b: model.aboutColor = false,
                            c: model.contactColor = false,
                            d: model.profileColor = false,
                            color: model.cartColor = true);
                      },
                      selected: model.cartColor,
                      leading: Icon(Icons.shopping_cart),
                      title: Text("Cart"),
                    ),
                    ListTile(
                      onTap: () {
                        model.changeColor(
                            a: model.homeColor = false,
                            b: model.cartColor = false,
                            c: model.contactColor = false,
                            d: model.profileColor = false,
                            color: model.aboutColor = true);
                      },
                      selected: model.aboutColor,
                      leading: Icon(Icons.info),
                      title: Text("About"),
                    ),
                    ListTile(
                      onTap: () {
                        model.changeColor(
                            a: model.homeColor = false,
                            b: model.cartColor = false,
                            c: model.contactColor = false,
                            d: model.aboutColor = false,
                            color: model.profileColor = true);

                        model.goToProfile();
                      },
                      selected: model.profileColor,
                      leading: Icon(Icons.info),
                      title: Text("Profile"),
                    ),
                    ListTile(
                      onTap: () {
                        model.changeColor(
                          a: model.homeColor = false,
                          b: model.aboutColor = false,
                          c: model.cartColor = false,
                          d: model.profileColor = false,
                          color: model.contactColor = true,
                        );

                        model.goToContactUs();
                      },
                      selected: model.contactColor,
                      leading: Icon(Icons.phone),
                      title: Text("Contact"),
                    ),
                    ListTile(
                      onTap: () => model.signOut(),
                      leading: Icon(Icons.exit_to_app),
                      title: Text("Log Out"),
                    ),
                  ]),
                )
              : CircularProgressIndicator();
        },
        viewModelBuilder: () => DrawerViewModel());
  }
}
