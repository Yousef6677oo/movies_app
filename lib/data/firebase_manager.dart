import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../custom_exception/internet_exception/no_internet.dart';
import '../custom_exception/sign_in_exceptions/user_not_found.dart';
import '../custom_exception/sign_in_exceptions/wrong_password.dart';
import '../custom_exception/sign_up_exceptions/email_already_in_use.dart';
import '../custom_exception/sign_up_exceptions/weak_password.dart';
import '../model/userDM.dart';

abstract class FireBaseManager {
  static Future<void> signInFireBase(String email, String password) async {
    try {
      if (!await InternetConnectionChecker().hasConnection) {
        throw NoInternet();
      }
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      await getUserFromFireStore(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFound();
      } else if (e.code == 'wrong-password') {
        throw WrongPassword();
      }
    }
  }

  static Future<void> signUpFireBase(String fullName, String mobileNumber,String email, String password) async {
    try {
      if (!await InternetConnectionChecker().hasConnection) {
        throw NoInternet();
      }
      UserCredential  credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await saveUserInFireStore(credential.user!.uid,fullName,mobileNumber,email);
      UserDM.currentUser = UserDM(uid: credential.user!.uid,email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPassword();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUse();
      }
    }
  }

  static Future saveUserInFireStore(String uid, String fullName,String mobileNumber,String email) {
    CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
    DocumentReference userDocument = userCollection.doc(uid);
    return userDocument.set({"id": uid,"fullName": fullName,"mobileNumber":mobileNumber,"email":email});
  }

  static Future<UserDM> getUserFromFireStore(String uid) async {
    CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
    DocumentReference doc = userCollection.doc(uid);
    DocumentSnapshot snapshot = await doc.get();
    Map json = snapshot.data() as Map;
    UserDM user = UserDM(uid: uid, email: json['email']);
    return user;
  }
}
