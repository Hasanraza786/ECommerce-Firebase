import 'dart:io';
import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/models/userModel.dart';
import 'package:eCommerce/services/FireStoreService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestoreService _firestoreService =
      locator<FirebaseFirestoreService>();

  UserModel _currentUser;
  UserModel get currentUser => _currentUser;

  String _imageUrl;

  String get imageUrl => _imageUrl;

  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required name,
    @required gender,
    @required phoneNumber,
  }) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      _currentUser = UserModel(
          id: authResult.user.uid,
          email: email,
          name: name,
          gender: gender,
          phoneNumber: phoneNumber);

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

  Future isUserLoggedIn() async {
    User user = _auth.currentUser;
    if (user != null) {
      await _populateCurrentUser(user);
    }
    return user != null;
  }

  Future _populateCurrentUser(User user) async {
    try {
      if (user != null) {
        _currentUser = await _firestoreService.getUser(user.uid);
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future logOut() async {
    await _auth.signOut();
  }

  Future uploadImage({File image}) async {
    User user = _auth.currentUser;
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("UserImage/${user.uid}");
    firebase_storage.UploadTask uploadTask = storageReference.putFile(image);
    _imageUrl = await (await uploadTask).ref.getDownloadURL();
  }
}

// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:eCommerce/app/locator.dart';
// import 'package:eCommerce/models/userModel.dart';
// import 'package:eCommerce/services/AuthService.dart';
// // import 'package:eCommerce/models/productModel.dart';
// import 'package:flutter/services.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter/services.dart';
// // import 'package:eCommerce/models/MessagesModel.dart';
// // import 'package:eCommerce/models/TokenModel.dart';
// // import 'package:eCommerce/models/UserModel.dart';

// class FirestoreService {
//   AuthService _authService = locator<AuthService>();

//   final CollectionReference _user =
//       FirebaseFirestore.instance.collection('user');

//   final CollectionReference _singleProducts =
//       FirebaseFirestore.instance.collection('product');

//   final CollectionReference _categoryProducts =
//       FirebaseFirestore.instance.collection('category');

//   final CollectionReference _homeFeatures =
//       FirebaseFirestore.instance.collection('homefeature');

//   final CollectionReference _homeArchives =
//       FirebaseFirestore.instance.collection('homearchive');
//   final CollectionReference _categoryIcon =
//       FirebaseFirestore.instance.collection('categoryicon');

//   Future createUser(UserModel user) async {
//     try {
//       await _user.doc(user.id).set(user.toJson());
//     } catch (e) {
//       if (e is PlatformException) {
//         return e.message;
//       }

//       return e.toString();
//     }
//   }

//   Future updateUserDetail(
//       {UserModel user, name, gender, phoneNumber, email, uid}) async {
//     try {
//       await _user.doc(user.id).set({
//         "email": email,
//         "name": name,
//         "gender": gender,
//         "phoneNumber": phoneNumber,
//         "image": _authService.imageUrl
//       });
//       await getUser(uid);
//     } catch (e) {
//       if (e is PlatformException) {
//         return e.message;
//       }

//       return e.toString();
//     }
//   }

//   List categoryIconData = [];
//   Future getCategoryIcon() async {
//     try {
//       var categoryIcons = await _categoryIcon.get();

//       if (categoryIcons != null) {
//         categoryIconData = categoryIcons.docs;
//       }
//     } catch (e) {
//       if (e is PlatformException) {
//         print(e.message);
//       }
//       print(e.toString());
//     }
//   }

//   List featureProductsData = [];
//   Future getFeatureProducts() async {
//     try {
//       var featureProducts = await _singleProducts
//           .doc("zqkZKf1I2Rl8qCmzXWlw")
//           .collection("featureproduct")
//           .get();

//       if (featureProducts != null) {
//         featureProductsData = featureProducts.docs;
//       }
//     } catch (e) {
//       if (e is PlatformException) {
//         print(e.message);
//       }
//       print(e.toString());
//     }
//   }

//   List archiveProductsData = [];
//   Future getArchivesProducts() async {
//     try {
//       var archiveProducts = await _singleProducts
//           .doc("zqkZKf1I2Rl8qCmzXWlw")
//           .collection("newarchives")
//           .get();

//       if (archiveProducts != null) {
//         archiveProductsData = archiveProducts.docs;
//       }
//     } catch (e) {
//       if (e is PlatformException) {
//         print(e.message);
//       }
//       print(e.toString());
//     }
//   }

//   List homefeatureData = [];
//   Future getHomeFeature() async {
//     try {
//       var homefeature = await _homeFeatures.get();

//       if (homefeature != null) {
//         homefeatureData = homefeature.docs;
//       }
//     } catch (e) {
//       if (e is PlatformException) {
//         print(e.message);
//       }
//       print(e.toString());
//     }
//   }

//   List homearchiveData = [];
//   Future getHomeArchives() async {
//     try {
//       var homearchives = await _homeArchives.get();

//       if (homearchives != null) {
//         homearchiveData = homearchives.docs;
//       }
//     } catch (e) {
//       if (e is PlatformException) {
//         print(e.message);
//       }
//       print(e.toString());
//     }
//   }

//   List dress = [];
//   Future getDress() async {
//     try {
//       var dressData = await _categoryProducts
//           .doc("FnlZVBIZ6StNZFEIt7zJ")
//           .collection("dress")
//           .get();

//       if (dressData != null) {
//         dress = dressData.docs;
//       }
//     } catch (e) {
//       if (e is PlatformException) {
//         print(e.message);
//       }
//       print(e.toString());
//     }
//   }

//   List pants = [];
//   Future getPants() async {
//     try {
//       var pantData = await _categoryProducts
//           .doc("FnlZVBIZ6StNZFEIt7zJ")
//           .collection("pant")
//           .get();

//       if (pantData != null) {
//         pants = pantData.docs;
//       }
//     } catch (e) {
//       if (e is PlatformException) {
//         print(e.message);
//       }
//       print(e.toString());
//     }
//   }

//   List shirts = [];
//   Future getShirts() async {
//     try {
//       var shirtData = await _categoryProducts
//           .doc("FnlZVBIZ6StNZFEIt7zJ")
//           .collection("shirt")
//           .get();

//       if (shirtData != null) {
//         shirts = shirtData.docs;
//       }
//     } catch (e) {
//       if (e is PlatformException) {
//         print(e.message);
//       }
//       print(e.toString());
//     }
//   }

//   List shoes = [];
//   Future getShoes() async {
//     try {
//       var shoedata = await _categoryProducts
//           .doc("FnlZVBIZ6StNZFEIt7zJ")
//           .collection("shoe")
//           .get();

//       if (shoedata != null) {
//         shoes = shoedata.docs;
//       }
//     } catch (e) {
//       if (e is PlatformException) {
//         print(e.message);
//       }
//       print(e.toString());
//     }
//   }

//   List ties = [];
//   Future getTies() async {
//     try {
//       var tieData = await _categoryProducts
//           .doc("FnlZVBIZ6StNZFEIt7zJ")
//           .collection("tie")
//           .get();

//       if (tieData != null) {
//         ties = tieData.docs;
//       }
//     } catch (e) {
//       if (e is PlatformException) {
//         print(e.message);
//       }
//       print(e.toString());
//     }
//   }

//   List notificationList = [];
//   void addNotification(notification) {
//     notificationList.add(notification);
//   }

//   Future getUser(String uid) async {
//     try {
//       var userData = await _user.doc(uid).get();

//       return UserModel.fromData(userData.data());
//     } catch (e) {
//       if (e) {
//         return e.message;
//       }

//       return e.toString();
//     }
//   }

// Future getAllUsersOnce(String currentUserUID) async {
//   try {
//     var usersDocumentSnapshot = await _singleProducts.get();
//     // String fcmToken = await _fcm.getToken();

//     // final tokenRef = _singleProducts
//     //     .doc(currentUserUID)
//     //     .collection('tokens')
//     //     .doc(fcmToken);
//     // await tokenRef.setData(
//     //   TokenModel(token: fcmToken, createdAt: FieldValue.serverTimestamp())
//     //       .toJson(),
//     // );
//     if (usersDocumentSnapshot.docs.isNotEmpty) {
//       return usersDocumentSnapshot.docs
//           .map((snapshot) => UserModel.fromMap(snapshot.data))
//           .where((mappedItem) => mappedItem.id != currentUserUID)
//           .toList();
//     }
//   } catch (e) {
//     if (e is PlatformException) {
//       return e.message;
//     }

//     return e.toString();
//   }
// }

// Future createMessage(MessagesModel message) async {
//   try {
//     await _messagesCollectionReference.document().setData(message.toJson());
//   } catch (e) {
//     if (e is PlatformException) {
//       return e.message;
//     }

//     return e.toString();
//   }
// }

// Stream listenToMessagesRealTime(String friendId, String currentUserId) {
//   // Register the handler for when the posts data changes
//   _requestMessages(friendId, currentUserId);
//   return _chatMessagesController.stream;
// }

// void _requestMessages(String friendId, String currentUserId) {
//   var messagesQuerySnapshot =
//       _messagesCollectionReference.orderBy('createdAt', descending: true);

//   messagesQuerySnapshot.snapshots().listen((messageSnapshot) {
//     if (messageSnapshot.documents.isNotEmpty) {
//       var messages = messageSnapshot.documents
//           .map((snapshot) => MessagesModel.fromMap(snapshot.data))
//           .where((element) =>
//               (element.receiverId == friendId &&
//                   element.senderId == currentUserId) ||
//               (element.receiverId == currentUserId &&
//                   element.senderId == friendId))
//           .toList();

//       _chatMessagesController.add(messages);
//     }
//   });
// }
// }
