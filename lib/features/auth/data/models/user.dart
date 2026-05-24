import 'dart:core';

class User {
  String name;
  String email;
  SignInMethod signInMethod;
  String sessionToken;
  String password;

  User(this.name, this.email, this.signInMethod, this.sessionToken, this.password);
}

enum SignInMethod{
  standard,
  google
}