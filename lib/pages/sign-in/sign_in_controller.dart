import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/values/constant.dart';
import 'package:u_learning/global.dart';
import 'package:u_learning/pages/sign-in/bloc/sign_in_bloc.dart';
import 'package:u_learning/widgets/flutter_toast.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String typeOfSignIn) async {
    try {
      if (typeOfSignIn == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.emailInitial;
        String passwordAddress = state.passwordInitial;
        if (emailAddress.isEmpty) {
          toastInfo(message: "you need to fill email address");
          return;
        }
        if (emailAddress.isNotEmpty) {
          String gmail = "@gmail.com";
          String yahoo = "@yahoo.com";
          if (emailAddress.contains("{$gmail}") &&
              (emailAddress.contains("{$yahoo}")) == false) {
            toastInfo(message: "your email must have $gmail or $yahoo");
            return;
          }
        }
        if (passwordAddress.isEmpty) {
          toastInfo(message: "you need to fill password");
        }
        if (passwordAddress.isNotEmpty) {
          if (passwordAddress.length < 8) {
            toastInfo(message: "your password must bigger than 7 letters");
            return;
          }
        }

        try {
          final dataComeFromFireBase = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: passwordAddress);

          if (dataComeFromFireBase.user == null) {
            toastInfo(message: "you don't exist");
          }
          if (!dataComeFromFireBase.user!.emailVerified) {
            // this mean you must verify your email for Auth مصداقيه
            toastInfo(message: "you need to verify your email account");
            return;
          }
          var user = dataComeFromFireBase.user;
          if (user != null) {
            Global.storageServices.setString(AppConstant.onUserLogin, "12341234");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/mainPages", (route) => false);
          } else {
            toastInfo(message: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "email-already-in-use") {
            toastInfo(message: "email already in use");
            // Navigator.pushNamed(context, "home");
          } else if (e.code == 'weak-password') {
            toastInfo(message: "your password provided is week!! try again");
          } else if (e.code == 'invalid-email') {
            toastInfo(message: "your email address format is wrong");
          }
        }
      }
      // else if(typeOfSignIn== "google"){
      //
      // }
      // else if(typeOfSignIn== "apple"){
      //
      // }
      // else if(typeOfSignIn== "facebook"){
      //
      // }
    } catch (e) {
      print(e);
    }
  }
}
