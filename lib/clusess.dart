import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sphinx/screens/HomeScreen/categorie.dart';
import 'package:sphinx/screens/auth/loginPage.dart';
import 'package:sphinx/screens/test.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'const/variable_const.dart';

// ------------------------- login --------------------
void loginAuth({
  required String emailAddress,
  required String password,
  required BuildContext context, // إضافة السياق هنا
}) async{
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password
    );
    _showDialog('Sucsess Login', context);
    Future.delayed(Duration(seconds: 1)).then((value) =>
        Get.offAll(Categorie())
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      _showDialog('No user found for that email.', context);

    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      _showDialog('Wrong password provided for that user', context);
    }
  }
}
//------------------- Register -----------------------------------
void register({
  required String emailAddress,
  required String password,
  required BuildContext context, // إضافة السياق هنا
}) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    _showDialog('Register Success', context);
    Future.delayed(Duration(seconds: 1)).then((value) =>
        Get.offAll(Categorie())
    );

  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      _showDialog('The password provided is too weak.', context);
    } else if (e.code == 'email-already-in-use') {
      _showDialog('The account already exists for that email.', context);
    }
  } catch (e) {
    _showDialog('An error occurred: $e', context);
  }
}

//-------------------------- showDialog-----------------------
void _showDialog(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Registration Result'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
//-- buildContainer_Categories -----
Container buildContainer_Categories({
  required ImageProvider<Object> image,
  required String text,
}) {
  return Container(
    width: 140,
    height: 110,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: image),
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

// --------------- log out--------------------

void logOut()async{
  await FirebaseAuth.instance.signOut();
  Future.delayed(Duration(seconds: 1)).then((value) =>
      Get.offAll(login())
  );
}

//------ phone luncher------
void phoneLuncher({required String phone}){
  launchUrlString("tel:$phone");
}
