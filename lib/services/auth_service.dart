import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rhinopizzaria/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUpUser(String email, String password, bool isAdmin) async {
    try {
       await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postUser(isAdmin)})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });



    } on SocketException {
      return " please ";
    } catch (e) {
      return '${e}';
    }
  }

  Future<UserModel?> signInUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

   postUser(bool isAdmin) async {
    User? user=_auth.currentUser;
  UserModel userModel=UserModel(uId: user!.uid, isAdmin:isAdmin );
    var respone = await put(
        Uri.parse(
            'https://pizzaria-30b01-default-rtdb.firebaseio.com/user/${user.uid}.json'),
        body: json.encode(userModel.toJson()));

    if (respone.statusCode == 200) {}
    return null;
  }
}
