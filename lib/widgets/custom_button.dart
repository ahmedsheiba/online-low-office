import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.ontap,
      this.txtcolor,
      this.color = Colors.white,
      required this.text});
  String text;
  VoidCallback? ontap;
  Color? color;
  Color? txtcolor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        height: 40,
        width: 150,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: txtcolor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico'),
        )),
      ),
    );
  }
}
