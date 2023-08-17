import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../custom_exception/internet_exception/no_internet.dart';
import '../custom_exception/sign_in_exceptions/user_not_found.dart';
import '../custom_exception/sign_in_exceptions/wrong_password.dart';
import '../custom_exception/sign_up_exceptions/email_already_in_use.dart';
import '../custom_exception/sign_up_exceptions/weak_password.dart';

abstract class FireBaseManager {
  static Future<void> signIn(String email, String password) async {
    try {
      if (!await InternetConnectionChecker().hasConnection) {
        throw NoInternet();
      }
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFound();
      } else if (e.code == 'wrong-password') {
        throw WrongPassword();
      }
    }
  }

  static Future<void> signUpFireBase(String fullName, String mobileNumber,
      String email, String password) async {
    try {
      if (!await InternetConnectionChecker().hasConnection) {
        throw NoInternet();
      }
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPassword();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUse();
      }
    }
  }
}
