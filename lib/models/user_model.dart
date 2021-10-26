import 'package:firebase_auth/firebase_auth.dart';
import 'package:rhinopizzaria/main.dart';

class UserModel {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String uId;

  bool isAdmin;

  UserModel({
    required this.uId,
    required this.isAdmin,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      isAdmin: json['isAdmin'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uId': uId,
        'isAdmin': isAdmin,
      };
}
