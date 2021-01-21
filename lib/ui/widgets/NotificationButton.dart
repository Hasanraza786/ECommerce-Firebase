import 'package:eCommerce/services/storageService.dart';
import 'package:flutter/material.dart';
import 'package:eCommerce/app/locator.dart';
import 'package:badges/badges.dart';

class NotificationButton extends StatelessWidget {
  final StorageService _storageService = locator<StorageService>();
  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeContent: Text(_storageService.notificationList.length.toString(),
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: Colors.white)),
      position: BadgePosition(end: 8, top: 8),
      badgeColor: Colors.red,
      child: IconButton(
          icon: Icon(Icons.notifications_none, color: Colors.black),
          onPressed: () {}),
    );
  }
}
