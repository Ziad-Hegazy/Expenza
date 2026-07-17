import 'dart:core';

class User {
  String firstName;
  String lastName;
  String email;
  SignInMethod signInMethod;
  String sessionToken;
  String password;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.signInMethod,
    required this.sessionToken,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      signInMethod: SignInMethod.values.singleWhere(
        (s) => s.name == (json['signInMethod'] ?? 'standard'),
      ),
      sessionToken: json['sessionToken'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'signInMethod': signInMethod,
      'sessionToken': sessionToken,
      'password': password,
    };
  }
}

enum SignInMethod { standard, google }
