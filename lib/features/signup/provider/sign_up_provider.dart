import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:memoneet_task/utils/app_snack_bar.dart';

class SignUpProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> registerUser(
      BuildContext context, String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .whenComplete(
        () {
          AppSnackbar().successSnackBar('Register Successfully', context);
          Navigator.pop(context);
        },
      );

      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      notifyListeners();

      AppSnackbar().errorSnackBar(e.toString(), context);
    }
  }
}
