
import 'package:firebase_auth/firebase_auth.dart';

abstract class FireBaseManager{
  static Future<void> signUpFireBase(String fullName,String mobileNumber,String email,String password) async {
    try {
      var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("enter home page successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception(e.code);
      } else if (e.code == 'email-already-in-use') {
        throw Exception("email is already in use");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  static Future<void> signIn(String email,String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception(e.message);
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }
}