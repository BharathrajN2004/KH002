import 'package:flutter/foundation.dart';

class User {
  String token;
  String name;
  String profile;
  String email;
  String password;
  int passcode;
  DateTime dob;
  List<Map<String, dynamic>>? paymenOptions;

  User({
    required this.token,
    required this.name,
    required this.profile,
    required this.email,
    required this.password,
    required this.passcode,
    required this.dob,
    this.paymenOptions,
  });

  factory User.empty() {
    return User(
      token: "",
      name: '',
      profile: "",
      email: "",
      password: "",
      passcode: 0000,
      dob: DateTime.now(),
    );
  }
  
}
