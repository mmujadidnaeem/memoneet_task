import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/app_snack_bar.dart';
import '../../mcqs/view/mcqs_page.dart';

class SignInProvider extends ChangeNotifier {
  bool isLoading = false;

  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .whenComplete(
        () {
          AppSnackbar().successSnackBar('Login Successfully', context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const McqsPage(),
              ));
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
