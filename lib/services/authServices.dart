import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/view/screens/auth/changeSuccessful.dart';
import 'package:was_gibts_in/view/screens/location/request_location_permission.dart';

class AuthServices {
  signIn(email, password, context) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => loadingSpinKit());
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(
          msg: "login Successfully", backgroundColor:kSecondaryColor);
      Get.to(() => RequestLocationPermission(),
          transition: Transition.rightToLeft,
          duration: Duration(milliseconds: 400));
      print("show");
      print(credential.user?.uid);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      print("od:${credential.user?.uid}");
      prefs.setString("userId", credential.user!.uid.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(msg:e.toString(),backgroundColor: Colors.orange);
      }
    } catch (e) {
      Navigator.pop(context);

      Fluttertoast.showToast(msg: "unExpected: $e",backgroundColor:Colors.orange);
    }
  }

  Future<void> resetPassword(String email , context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
       builder: (context) => loadingSpinKit(),);
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.back();
      Fluttertoast.showToast(msg: "password sent Successfully",backgroundColor:kSecondaryColor);
    } on FirebaseAuthException catch (e) {
        Get.back();
        if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "o user found for that email");
      }else{
        Fluttertoast.showToast(msg: e.toString(),backgroundColor: Colors.orange);
      }
    }
  }

  var auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;
  changePassword(oldPassword, newPassword,context) async {
     showDialog(
      context: context,
      barrierDismissible: false,
       builder: (context) => loadingSpinKit(),);
    var cred = EmailAuthProvider.credential(
        email: currentUser!.email.toString(), password: oldPassword);
    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newPassword);
      Get.to(() => ChangeSuccessfulScreen());
      Fluttertoast.showToast(
          msg: "password change Successfully",
          backgroundColor: kSecondaryColor);
    }).catchError((error) {
      Get.back();
      print(error.toString());
    });
  }
}
