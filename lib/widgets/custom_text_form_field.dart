import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      this.onChanged,
      this.hinttext,
      this.controller,
      this.obscureText = false});
  String? hinttext;
  Function(String)? onChanged;

  TextEditingController? controller = TextEditingController();

  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      style: const TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
      validator: (data) {
        if (data!.isEmpty) {
          return 'field required';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
    );
  }
}
