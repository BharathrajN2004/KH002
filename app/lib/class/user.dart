import 'package:flutter/foundation.dart';

class User {
  String token;
  String name;
  String id;
  // String profile;
  String email;
  String password;
  int phoneNo;
  List<Map<String, dynamic>>? paymenOptions;

  User({
    required this.token,
    required this.name,
    required this.id,
    // required this.profile,
    required this.email,
    required this.password,
    required this.phoneNo,
    this.paymenOptions,
  });

}
