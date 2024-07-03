import 'package:flutter/material.dart';

class AppSnackbar {
  void successSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.teal, content: Text(message)));
  }

  void errorSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.down,
        backgroundColor: Colors.redAccent,
        content: Text(message)));
  }
}
