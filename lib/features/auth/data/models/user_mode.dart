import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String firstName;
  String lastName;
  String email;
  bool hasPassword;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.hasPassword,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      hasPassword: map['hasPassword'],
    );
  }

  factory UserModel.fromAuth(User user) {
    List<String>? name = user.displayName?.split(" ");
    bool hasPassword = user.providerData.any((p) => p.providerId == "password");

    return UserModel(
      firstName: name?[0] ?? "",
      lastName: name?.removeAt(0) ?? "",
      email: user.email ?? "",
      hasPassword: hasPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'hasPassword': hasPassword,
    };
  }
}

// enum SignInMethod { standard, google, apple;}
