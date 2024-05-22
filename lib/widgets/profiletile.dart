import 'package:flutter/material.dart';
import 'package:low_office/helper/constant.dart';

profileTile(String title, String subtitle, IconData iconData, Color textColor,
    Color tileColor, Function() onTap) {
  return Container(
    decoration: BoxDecoration(
      color: tileColor,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 5),
          color: Colors.white.withOpacity(0.7),
          spreadRadius: 2,
          blurRadius: 10,
        )
      ],
    ),
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      subtitle: Text(subtitle, style: TextStyle(color: textColor)),
      leading: Icon(iconData),
      trailing: GestureDetector(
        child: Icon(
          Icons.arrow_forward,
          color: kPrimaryColor,
        ),
        onTap: onTap,
      ),
      tileColor: Colors.white,
    ),
  );
}
