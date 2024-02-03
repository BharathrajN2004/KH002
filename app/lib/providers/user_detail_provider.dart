// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../class/user.dart';

class UserDetailNotifier extends StateNotifier<User?> {
  UserDetailNotifier() : super(null);

  void addUserData(Map<String, dynamic> userData) {
    state = User(
      token: userData["token"],
      name: userData["name"],
      profile: userData["profile"],
      email: userData["email"],
      password: userData["password"],
      passcode: userData["passcode"],
      dob: userData["dob"],
    );
  }
}

final userDataProvider = StateNotifierProvider<UserDetailNotifier, User?>(
    (ref) => UserDetailNotifier());
