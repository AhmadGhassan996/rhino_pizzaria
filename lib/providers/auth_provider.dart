
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:rhinopizzaria/models/user_model.dart';
import 'package:rhinopizzaria/services/auth_service.dart';

class AuthProvider with ChangeNotifier{
  final AuthService _authService=AuthService();
  bool isLoading= false;
  User? authData;


  Future<void> signUpUser(String email,String password,bool isAdimn)async{
    isLoading=true;
    notifyListeners();
    authData=await _authService.signUpUser(email, password,isAdimn);

    isLoading=false;
    notifyListeners();
  }

  Future<void> signInUser(String email,String password)async{
    isLoading=true;
    notifyListeners();
  //  authData=await _authService.signInUser(email, password);

    isLoading=false;
    notifyListeners();
  }

}