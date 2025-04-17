import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle HeadlineTextFieldStyle() {
    return TextStyle(
        color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold);
  }

  static TextStyle SimpleTextFieldStyle() {
    return TextStyle(color: Colors.black, fontSize: 18.0);
  }

  static TextStyle WhiteTextFieldStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold);
  }

  static TextStyle boldTextFieldStyle() {
    return TextStyle(
        color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold);
  }

  static TextStyle priceTextFieldStyle() {
    return TextStyle(
        color: const Color.fromARGB(182, 0, 0, 0),
        fontSize: 18.0,
        fontWeight: FontWeight.bold);
  }

  static TextStyle boldWhiteTextFieldStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold);
  }
}
