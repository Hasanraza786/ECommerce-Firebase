import 'package:eCommerce/ui/theme/AppColors.dart';
import 'package:eCommerce/ui/views/ContactUs/contactUsViewMode.dart';
import 'package:eCommerce/ui/widgets/CustomAppBar.dart';
import 'package:eCommerce/ui/widgets/busyButton.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContactUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactUsViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
              appBar: customAppBar(
                  context: context,
                  leadingWidget: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: AppColors.priceColor,
                      ),
                      onPressed: () => model.goBack())),
              key: model.scaffoldKey,
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 27),
                height: 600,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Sent Us Your Message",
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontSize: 28),
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            model.userModel.name,
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            model.userModel.email,
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      child: TextFormField(
                        controller: model.messageController,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: " Message"),
                      ),
                    ),
                    BusyButton(
                        title: "Submit", onPressed: () => model.validation())
                  ],
                ),
              ));
        },
        viewModelBuilder: () => ContactUsViewModel());
  }
}
