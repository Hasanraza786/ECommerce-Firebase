import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:eCommerce/models/userModel.dart';
import 'package:eCommerce/services/AuthService.dart';
import 'package:eCommerce/services/storageService.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ProfileViewModel extends BaseViewModel {
  AuthService _authService = locator<AuthService>();
  StorageService _storageService = locator<StorageService>();
  NavigationService _navigationService = locator<NavigationService>();
  UserModel get user => _authService.currentUser;
  TextEditingController userNameController;
  TextEditingController numberController;
  TextEditingController adressController;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void validation() async {
    if (userNameController.text.isEmpty &&
        numberController.text.isEmpty &&
        adressController.text.isEmpty) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("All Field Are Empty")));
    } else if (userNameController.text.length < 6) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Name Must be 6")));
    } else if (numberController.text.length < 11 ||
        numberController.text.length > 11) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Phone Number Must be 11")));
    } else if (adressController.text.isEmpty) {
      scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text("Adress must not be empty")));
    } else {
      user.image == null ? await imageUpload() : await updateUser();
      isEdit();
    }
    notifyListeners();
  }

  bool edit = false;

  void isEdit() async {
    edit = !edit;
    await _storageService.getUser(user.id);
    notifyListeners();
  }

  void setValue() {
    userNameController = TextEditingController(text: user.name);
    numberController = TextEditingController(text: user.phoneNumber);
    adressController = TextEditingController(text: user.adress);

    if (user.gender == "Male") {
      isMale = true;
    } else {
      isMale = false;
    }
    notifyListeners();
  }

  bool isMale;

  void toggleGender() {
    isMale = !isMale;
    notifyListeners();
  }

  void goBack() {
    _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    notifyListeners();
  }

  File imageFile;
  final picker = ImagePicker();
  imgFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  imgFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);

      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  void showPicker(context) {
    showFlexibleBottomSheet(
        context: context,
        initHeight: 0.15,
        maxHeight: 0.4,
        builder: (
          context,
          scrollController,
          double bottomSheetOffset,
        ) =>
            Scaffold(
              body: SafeArea(
                child: Container(
                  child: new Wrap(
                    children: <Widget>[
                      new ListTile(
                          leading: new Icon(Icons.photo_library),
                          title: new Text(
                            'Photo Library',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          onTap: () {
                            imgFromGallery();
                            Navigator.of(context).pop();
                          }),
                      new ListTile(
                        leading: new Icon(Icons.photo_camera),
                        title: new Text('Camera',
                            style: Theme.of(context).textTheme.headline2),
                        onTap: () {
                          imgFromCamera();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Future imageUpload() async {
    await _authService.uploadImage(image: imageFile);
    await updateUser();
    await _storageService.getUser(user.id);

    notifyListeners();
  }

  Future updateUser() async {
    await _storageService.updateUserDetail(
        gender: isMale == true ? "Male" : "Female",
        user: user,
        name: userNameController.text,
        phoneNumber: numberController.text,
        email: user.email,
        uid: user.id,
        image: user.image != null ? user.image : "",
        adress: adressController.text);
    await _storageService.getUser(user.id);

    notifyListeners();
  }
}
