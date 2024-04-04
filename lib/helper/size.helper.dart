import 'package:flutter/material.dart';

class DCSize {
  // Size size = MediaQuery.of(context).size;
  // double width = size.width;
  // double height = size.height;
  InputDecoration inputDec(String placeHolder) => InputDecoration(
        hintText: placeHolder,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(4.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.all(Radius.circular(9.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orangeAccent),
        ),
        contentPadding: EdgeInsets.all(15.3),
      );
}
