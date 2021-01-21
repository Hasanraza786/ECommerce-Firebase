import 'package:eCommerce/ui/theme/AppColors.dart';
import 'package:eCommerce/ui/widgets/NotificationButton.dart';
import 'package:eCommerce/ui/widgets/ProfileScreenWidgets.dart';
import 'package:eCommerce/ui/widgets/busyButton.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:eCommerce/ui/widgets/CustomAppBar.dart';
import 'package:eCommerce/ui/views/ProfileView/profileViewModel.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        onModelReady: (model) => model.setValue(),
        builder: (context, model, child) {
          print([
            "userrrrrNamee",
            model.user.image,
          ]);

          return Scaffold(
            key: model.scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xfff8f8f8),
            appBar: customAppBar(
              leadingWidget: model.edit == true
                  ? IconButton(
                      icon: Icon(Icons.close, color: AppColors.priceColor),
                      onPressed: () => model.isEdit())
                  : IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColors.priceColor),
                      onPressed: () => model.goBack()),
              context: context,
              title: "Profile View",
              actions: [
                model.edit == false
                    ? NotificationButton()
                    : IconButton(
                        icon: Icon(
                          Icons.check,
                          size: 18,
                          color: AppColors.priceColor,
                        ),
                        onPressed: () {
                          model.validation();
                        })
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: 130,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    maxRadius: 65,
                                    backgroundImage: model.user.image == ""
                                        ? AssetImage(
                                            "assets/images/profile.jpg")
                                        : NetworkImage(
                                            model.user.image,
                                          ),
                                  ),
                                ],
                              )),
                          model.edit == true
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 100.0, top: 65),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: GestureDetector(
                                      onTap: () => model.showPicker(context),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        child: Icon(Icons.camera_alt,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      Container(
                        height: 400,
                        width: double.infinity,
                        child: model.edit == true
                            ? Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  singleTextField(
                                      controller: model.userNameController,
                                      context: context,
                                      name: model.userNameController.text),
                                  singleContainer(
                                      context: context,
                                      startText: "Email",
                                      endText: model.user.email),
                                  GestureDetector(
                                    onTap: () => model.toggleGender(),
                                    child: singleContainer(
                                        context: context,
                                        startText: "Gender",
                                        endText: model.isMale == true
                                            ? "Male"
                                            : "Female"),
                                  ),
                                  singleTextField(
                                      controller: model.numberController,
                                      context: context,
                                      name: model.numberController.text,
                                      inputType: TextInputType.number)
                                ],
                              )
                            : Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  singleContainer(
                                      context: context,
                                      startText: "Name",
                                      endText: model.user.name),
                                  singleContainer(
                                      context: context,
                                      startText: "Email",
                                      endText: model.user.email),
                                  singleContainer(
                                      context: context,
                                      startText: "Gender",
                                      endText: model.user.gender),
                                  singleContainer(
                                      context: context,
                                      startText: "Phone Number",
                                      endText: model.user.phoneNumber)
                                ],
                              ),
                      ),
                      Container(
                          width: 200,
                          child: model.edit == false
                              ? BusyButton(
                                  title: "Edit Profile",
                                  onPressed: () => model.isEdit(),
                                  textColor: Colors.white,
                                )
                              : Container())
                    ])),
          );
        },
        viewModelBuilder: () => ProfileViewModel());
  }
}
